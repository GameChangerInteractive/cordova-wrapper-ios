# wrapper-ios
:iphone: native cordova-enabled ios webview that wraps our website

# How to import on your project

[idle]: https://github.com/GameChangerInteractive/cordova-wrapper-ios/blob/master/screenshot/screenshot.png  "idle"

![Snapshot][idle]

# How to use on your project

- (IBAction)goGameSite:(id)sender {

    GcmvpCordovaViewController *gcmvp = [[GcmvpCordovaViewController alloc] init];
    
    [gcmvp setWwwFolderName:@"https://games.gamechanger.studio/develop"]; //you can set your custome URL
    
    [self.navigationController pushViewController:gcmvp animated:YES];
    
}
