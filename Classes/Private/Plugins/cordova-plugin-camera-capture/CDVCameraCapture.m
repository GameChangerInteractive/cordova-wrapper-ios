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

#import "CDVCameraCapture.h"
#import "AVFoundation/AVFoundation.h"

@implementation CDVCameraCapture

- (BOOL) findCamera: (BOOL) useFrontCamera
{
    // 1. Get a list of available devices:
    // specifying AVMediaTypeVideo will ensure we only get a list of cameras, no microphones
    NSArray * devices = [AVCaptureDevice devicesWithMediaType: AVMediaTypeVideo];
    
    // 2. Iterate through the device array and if a device is a camera, check if it's the one we want:
    for (AVCaptureDevice * device in devices)
    {
        if (useFrontCamera && AVCaptureDevicePositionFront == [device position])
        {
            // We asked for the front camera and got the front camera, now keep a pointer to it:
            self.camera = device;
        }
        else if (!useFrontCamera && AVCaptureDevicePositionBack == [device position])
        {
            // We asked for the back camera and here it is:
            self.camera = device;
        }
    }
    
    // 3. Set a frame rate for the camera:
    if (NULL != self.camera)
    {
        // We firt need to lock the camera, so noone else can mess with its configuration:
        if ([self.camera lockForConfiguration: NULL])
        {
            // Set a minimum frame rate of 10 frames per second
            [self.camera setActiveVideoMinFrameDuration: CMTimeMake(1, 10)];
            
            // and a maximum of 30 frames per second
            [self.camera setActiveVideoMaxFrameDuration: CMTimeMake(1, 30)];
            
            [self.camera unlockForConfiguration];
        }
    }
    
    // 4. If we've found the camera we want, return true
    return ( NULL != self.camera );
}

- (BOOL) attachCameraToCaptureSession
{
    // 0. Assume we've found the camera and set up the session first:
    assert(NULL != self.camera);
    assert(NULL != self.session);
    
    // 1. Initialize the camera input
    AVCaptureDeviceInput *cameraInput;
    
    // 2. Request a camera input from the camera
    NSError * error = NULL;
    cameraInput = [AVCaptureDeviceInput deviceInputWithDevice: self.camera error: &error];
    
    // 2.1. Check if we've got any errors
    if (NULL != error)
    {
        // TODO: send an error event to ActionScript
        return false;
    }
    
    // 3. We've got the input from the camera, now attach it to the capture session:
    if ([self.session canAddInput: cameraInput])
    {
        [self.session addInput: cameraInput];
    }
    else
    {
        // TODO: send an error event to ActionScript
        return false;
    }
    
    // 4. Done, the attaching was successful, return true to signal that
    return true;
}

- (void) setupVideoOutput
{
    // 1. Create the video data output
    AVCaptureVideoDataOutput *videoOutput = [[AVCaptureVideoDataOutput alloc] init];
    
    // 2. Create a queue for capturing video frames
    dispatch_queue_t captureQueue = dispatch_queue_create( "captureQueue", DISPATCH_QUEUE_SERIAL );
    
    // 3. Use the AVCaptureVideoDataOutputSampleBufferDelegate capabilities of CameraDelegate:
    [videoOutput setSampleBufferDelegate: self queue: captureQueue];
    
    // 4. Set up the video output
    // 4.1. Do we care about missing frames?
    videoOutput.alwaysDiscardsLateVideoFrames = true;
    
    // 4.2. We want the frames in some RGB format, which is what ActionScript can deal with
    NSNumber * framePixelFormat = [NSNumber numberWithInt: kCVPixelFormatType_32BGRA];
    videoOutput.videoSettings = [NSDictionary dictionaryWithObject: framePixelFormat
                                                               forKey: (id) kCVPixelBufferPixelFormatTypeKey];

    // 5. Add the video data output to the capture session
    [self.session addOutput: videoOutput];
}

- (void) captureOutput: (AVCaptureOutput *) captureOutput
   didOutputSampleBuffer: (CMSampleBufferRef) sampleBuffer
          fromConnection: (AVCaptureConnection *) connection
{
        CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
        CVPixelBufferLockBaseAddress(imageBuffer, 0);
        void *baseAddress = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0);
        size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
        size_t width = CVPixelBufferGetWidth(imageBuffer);
        size_t height = CVPixelBufferGetHeight(imageBuffer);
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
        CGImageRef quartzImage = CGBitmapContextCreateImage(context);
        CVPixelBufferUnlockBaseAddress(imageBuffer,0);
        CGContextRelease(context);
        CGColorSpaceRelease(colorSpace);
        UIImage *image = [UIImage imageWithCGImage:quartzImage];
        CGImageRelease(quartzImage);
        NSData *imageData = UIImageJPEGRepresentation(image, 0.3);
        NSString *encodedString = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        NSString *javascript = @"cordova.plugins.CameraStream.capture('data:image/jpeg;base64,";
        javascript = [javascript stringByAppendingString:encodedString];
        javascript = [javascript stringByAppendingString:@"');"];
        UIWebView* uiWebView = (UIWebView*)self.webView;
        dispatch_async(dispatch_get_main_queue(), ^{
            [uiWebView stringByEvaluatingJavaScriptFromString:javascript];
        });
}

- (void)startCapture:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult;
    NSString *cameraString;
    
    if ([command.arguments count] == 0) {
        cameraString = @"back";
    } else {
        cameraString = [command argumentAtIndex:0];
    }
    
    BOOL useFrontCamera = [cameraString isEqualToString:@"front"];
    self.session = [[AVCaptureSession alloc] init];
    
    if (![self findCamera:useFrontCamera]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to create camera"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    
    if (![self attachCameraToCaptureSession]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Unable to attach camera to capture session"];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }
    
    [self setupVideoOutput];
    [self.session startRunning];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)stopCapture:(CDVInvokedUrlCommand*)command
{
    if (self.session != NULL && self.session.isRunning) {
        [self.session stopRunning];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
