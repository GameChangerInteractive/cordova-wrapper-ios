# wrapper-ios
:iphone: native cordova-enabled ios webview that wraps our website

# How to import on your project

<a href="https://github.com/GameChangerInteractive/cordova-wrapper-ios/releases/download/v1.0.0/Screen.Shot.2017-10-09.at.9.43.47.AM.png" target="_blank"></a>

# How to use on your project

-- (IBAction)goGameSite:(id)sender {

    GcmvpCordovaViewController *gcmvp = [[GcmvpCordovaViewController alloc] init];
    
    [gcmvp setWwwFolderName:@"https://games.gamechanger.studio/develop"]; //you can set your custome URL
    
    [self.navigationController pushViewController:gcmvp animated:YES];
    
}
