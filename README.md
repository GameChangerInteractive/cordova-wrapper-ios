# wrapper-ios
:iphone: native cordova-enabled ios webview that wraps our website

<<<<<<< HEAD
# How to import on your project.

=======
# How to import on your project

[idle]: https://github.com/GameChangerInteractive/cordova-wrapper-ios/releases/download/v1.0.0/Screen.Shot.2017-10-09.at.9.43.47.AM.png  "idle"

![idle snapshot][idle]

# How to use on your project

-- (IBAction)goGameSite:(id)sender {

    GcmvpCordovaViewController *gcmvp = [[GcmvpCordovaViewController alloc] init];
    
    [gcmvp setWwwFolderName:@"https://games.gamechanger.studio/develop"]; //you can set your custome URL
    
    [self.navigationController pushViewController:gcmvp animated:YES];
    
}
>>>>>>> 60318db367ab3dd4e0f84769e4aedba4e9794e1b
