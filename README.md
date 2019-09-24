# iOS Cordova Wrapper
:iphone: native cordova-enabled ios webview that wraps GC games

## How to build from source

Select the GCMVP build target and build it.

## How to import on your project.

1. Add **GCMVP.framework** to **Embedded Binaries** in **General** tab of the settings of your project. 

1. on your AppDelegate.h

    ```
    #import <UIKit/UIKit.h>

    #import <CoreData/CoreData.h>

    #import "GCMVP/CDVAppDelegate.h"

    @interface AppDelegate : CDVAppDelegate

    //@property (strong, nonatomic) UIWindow *window;

    @property (readonly, strong) NSPersistentContainer *persistentContainer;

    -(void)saveContext;

    @end
    ```

2. on your ViewController.h

    ```
    #import <UIKit/UIKit.h>
    #import "GCMVP/CDVViewController.h"

    @interface ViewController : CDVViewController


    @end
    ```

3. on your ViewController.m
    ```
    #import "ViewController.h"

    @interface ViewController ()

    @end

    @implementation ViewController

    - (void)viewDidLoad {
        //you can set custom url here
        self.wwwFolderName = @"https://games.gamechanger.studio/develop";
        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
    }


    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }

    @end
    ```
    
## Demo Project

https://github.com/GameChangerInteractive/cordova-wrapper-ios/releases/download/1.0.5/GCCordovaWrapperExample.zip   
    
