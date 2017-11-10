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

#import <UIKit/UIKit.h>

//! Project version number for Cordova.
FOUNDATION_EXPORT double CordovaVersionNumber;

//! Project version string for Cordova.
FOUNDATION_EXPORT const unsigned char CordovaVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Cordova/PublicHeader.h>

#import <GCMVP/CDV.h>
#import <GCMVP/CDVCommandDelegateImpl.h>
#import <GCMVP/CDVAvailability.h>
#import <GCMVP/CDVAvailabilityDeprecated.h>
#import <GCMVP/CDVAppDelegate.h>
#import <GCMVP/CDVPlugin.h>
#import <GCMVP/CDVPluginResult.h>
#import <GCMVP/CDVViewController.h>
#import <GCMVP/CDVCommandDelegate.h>
#import <GCMVP/CDVCommandQueue.h>
#import <GCMVP/CDVConfigParser.h>
#import <GCMVP/CDVURLProtocol.h>
#import <GCMVP/CDVInvokedUrlCommand.h>
#import <GCMVP/CDVPlugin+Resources.h>
#import <GCMVP/CDVWebViewEngineProtocol.h>
#import <GCMVP/NSDictionary+CordovaPreferences.h>
#import <GCMVP/NSMutableArray+QueueAdditions.h>
#import <GCMVP/CDVUIWebViewDelegate.h>
#import <GCMVP/CDVWhitelist.h>
#import <GCMVP/CDVScreenOrientationDelegate.h>
#import <GCMVP/CDVTimer.h>
#import <GCMVP/CDVUserAgentUtil.h>
