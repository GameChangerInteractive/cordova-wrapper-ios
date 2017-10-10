/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#include <objc/message.h>
#import "GcmvpCDVCommandQueue.h"
#import "GcmvpCDVViewController.h"
#import "GcmvpCDVCommandDelegateImpl.h"
#import "CDVJSON_private.h"
#import "CDVDebug.h"

// Parse JS on the main thread if it's shorter than this.
static const NSInteger JSON_SIZE_FOR_MAIN_THREAD = 4 * 1024; // Chosen arbitrarily.
// Execute multiple commands in one go until this many seconds have passed.
static const double MAX_EXECUTION_TIME = .008; // Half of a 60fps frame.

@interface GcmvpCDVCommandQueue () {
    NSInteger _lastCommandQueueFlushRequestId;
    __weak GcmvpCDVViewController* _viewController;
    NSMutableArray* _queue;
    NSTimeInterval _startExecutionTime;
}
@end

@implementation GcmvpCDVCommandQueue

- (BOOL)currentlyExecuting
{
    return _startExecutionTime > 0;
}

- (id)initWithViewController:(GcmvpCDVViewController*)viewController
{
    self = [super init];
    if (self != nil) {
        _viewController = viewController;
        _queue = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dispose
{
    // TODO(agrieve): Make this a zeroing weak ref once we drop support for 4.3.
    _viewController = nil;
}

- (void)resetRequestId
{
    _lastCommandQueueFlushRequestId = 0;
}

- (void)enqueueCommandBatch:(NSString*)batchJSON
{
    if ([batchJSON length] > 0) {
        NSMutableArray* commandBatchHolder = [[NSMutableArray alloc] init];
        [_queue addObject:commandBatchHolder];
        if ([batchJSON length] < JSON_SIZE_FOR_MAIN_THREAD) {
            
            NSError* error = nil;
            id jsonVal = [NSJSONSerialization JSONObjectWithData:[batchJSON dataUsingEncoding:NSUTF8StringEncoding]
                                                        options:NSJSONReadingMutableContainers
                                                          error:&error];
            
            if (error != nil) {
                NSLog(@"NSString JSONObject error: %@", [error localizedDescription]);
            }

            [commandBatchHolder addObject:jsonVal];
//            [commandBatchHolder addObject:[batchJSON cdv_JSONObject]];
        } else {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^() {
                
                NSError* error = nil;
                id jsonVal = [NSJSONSerialization JSONObjectWithData:[batchJSON dataUsingEncoding:NSUTF8StringEncoding]
                                                               options:NSJSONReadingMutableContainers
                                                                 error:&error];
                
                if (error != nil) {
                    NSLog(@"NSString JSONObject error: %@", [error localizedDescription]);
                }
                
//                NSMutableArray* result = [batchJSON cdv_JSONObject];
                NSMutableArray* result = jsonVal;
                @synchronized(commandBatchHolder) {
                    [commandBatchHolder addObject:result];
                }
                [self performSelectorOnMainThread:@selector(executePending) withObject:nil waitUntilDone:NO];
            });
        }
    }
}

- (void)fetchCommandsFromJs
{
    __weak GcmvpCDVCommandQueue* weakSelf = self;
    NSString* js = @"cordova.require('cordova/exec').nativeFetchMessages()";

    [_viewController.webViewEngine evaluateJavaScript:js
                                    completionHandler:^(id obj, NSError* error) {
        if ((error == nil) && [obj isKindOfClass:[NSString class]]) {
            NSString* queuedCommandsJSON = (NSString*)obj;
            CDV_EXEC_LOG(@"Exec: Flushed JS->native queue (hadCommands=%d).", [queuedCommandsJSON length] > 0);
            [weakSelf enqueueCommandBatch:queuedCommandsJSON];
            // this has to be called here now, because fetchCommandsFromJs is now async (previously: synchronous)
            [self executePending];
        }
    }];
}

- (void)executePending
{
    // Make us re-entrant-safe.
    if (_startExecutionTime > 0) {
        return;
    }
    @try {
        _startExecutionTime = [NSDate timeIntervalSinceReferenceDate];

        while ([_queue count] > 0) {
            NSMutableArray* commandBatchHolder = _queue[0];
            NSMutableArray* commandBatch = nil;
            @synchronized(commandBatchHolder) {
                // If the next-up command is still being decoded, wait for it.
                if ([commandBatchHolder count] == 0) {
                    break;
                }
                commandBatch = commandBatchHolder[0];
            }

            while ([commandBatch count] > 0) {
                @autoreleasepool {
                    // Execute the commands one-at-a-time.
                    
                    if ([commandBatch count] == 0) {
                        continue;
                    }
                    
                    id head = [commandBatch objectAtIndex:0];
                    if (head != nil) {
                        // [[head retain] autorelease]; ARC - the __autoreleasing on the return value should so the same thing
                        [commandBatch removeObjectAtIndex:0];
                    }
                    
                    NSArray* jsonEntry = head;
                    
//                    NSArray* jsonEntry = [commandBatch cdv_dequeue];
                    if ([commandBatch count] == 0) {
                        [_queue removeObjectAtIndex:0];
                    }
                    CDVInvokedUrlCommand* command = [CDVInvokedUrlCommand commandFromJson:jsonEntry];
                    CDV_EXEC_LOG(@"Exec(%@): Calling %@.%@", command.callbackId, command.className, command.methodName);

                    if (![self execute:command]) {
#ifdef DEBUG
                        NSString* commandJson = nil;
                        {
                            NSError* error = nil;
                            NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonEntry
                                                                               options:0
                                                                                 error:&error];
                            
                            if (error != nil) {
                                NSLog(@"NSArray JSONString error: %@", [error localizedDescription]);
                            } else {
                                commandJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                            }
                        }
                        
//                            NSString* commandJson = [jsonEntry cdv_JSONString];
                            static NSUInteger maxLogLength = 1024;
                            NSString* commandString = ([commandJson length] > maxLogLength) ?
                                [NSString stringWithFormat : @"%@[...]", [commandJson substringToIndex:maxLogLength]] :
                                commandJson;

                            DLog(@"FAILED pluginJSON = %@", commandString);
#endif
                    }
                }

                // Yield if we're taking too long.
                if (([_queue count] > 0) && ([NSDate timeIntervalSinceReferenceDate] - _startExecutionTime > MAX_EXECUTION_TIME)) {
                    [self performSelector:@selector(executePending) withObject:nil afterDelay:0];
                    return;
                }
            }
        }
    } @finally
    {
        _startExecutionTime = 0;
    }
}

- (BOOL)execute:(CDVInvokedUrlCommand*)command
{
    if ((command.className == nil) || (command.methodName == nil)) {
        NSLog(@"ERROR: Classname and/or methodName not found for command.");
        return NO;
    }

    // Fetch an instance of this class
    CDVPlugin* obj = [_viewController.commandDelegate getCommandInstance:command.className];

    if (!([obj isKindOfClass:[CDVPlugin class]])) {
        NSLog(@"ERROR: Plugin '%@' not found, or is not a CDVPlugin. Check your plugin mapping in config.xml.", command.className);
        return NO;
    }
    BOOL retVal = YES;
    double started = [[NSDate date] timeIntervalSince1970] * 1000.0;
    // Find the proper selector to call.
    NSString* methodName = [NSString stringWithFormat:@"%@:", command.methodName];
    SEL normalSelector = NSSelectorFromString(methodName);
    NSLog(@"respondsToSelector obj = %@, methodName = %@", obj, methodName);
    if ([obj respondsToSelector:normalSelector]) {
        // [obj performSelector:normalSelector withObject:command];
        ((void (*)(id, SEL, id))objc_msgSend)(obj, normalSelector, command);
    } else {
        // There's no method to call, so throw an error.
        NSLog(@"ERROR: Method '%@' not defined in Plugin '%@'", methodName, command.className);
        retVal = NO;
    }
    double elapsed = [[NSDate date] timeIntervalSince1970] * 1000.0 - started;
    if (elapsed > 10) {
        NSLog(@"THREAD WARNING: ['%@'] took '%f' ms. Plugin should use a background thread.", command.className, elapsed);
    }
    return retVal;
}

@end
