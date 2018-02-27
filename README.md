# wrapper-ios v1.0.0
:iphone: native cordova-enabled ios webview that wraps our website

## How to build from source

Select the GCMVP build target and build it.

## How to import on your project.

1. Add **GCMVP.framework** to **Embedded Binaries** in **General** tab of the settings of your project. 

1. on your AppDelegate.h

    ```
    #import <UIKit/UIKit.h>

    #import <CoreData/CoreData.h>

    #import "GCMVP/GCMVPAppDelegate.h"

    @interface AppDelegate : GCMVPAppDelegate

    //@property (strong, nonatomic) UIWindow *window;

    @property (readonly, strong) NSPersistentContainer *persistentContainer;

    -(void)saveContext;

    @end
    ```

2. on your AppDelegate.m

    ```
    -(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

        // Override point for customization after application launch.

        [super application:application didFinishLaunchingWithOptions:launchOptions];

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        self.window.rootViewController = ([storyboard instantiateViewControllerWithIdentifier:@"startNavigationViewController"]);

        return YES;
    }
    ```
    
3. on your ViewController.m

    ```
    #import "ViewController.h"

    #import "GCMVP/GCMVPViewController.h"

    @interface ViewController ()

    @end

    @implementation ViewController

    -(void)viewDidLoad {

        [super viewDidLoad];

        // Do any additional setup after loading the view, typically from a nib.
    }


    -(void)didReceiveMemoryWarning {

        [super didReceiveMemoryWarning];

        // Dispose of any resources that can be recreated.
    }

    -(void)viewWillAppear:(BOOL)animated {

        [self.navigationController setNavigationBarHidden:YES];

    }

    -(IBAction)goGameSite:(id)sender {

        GCMVPViewController *vpController = [[GCMVPViewController alloc] init];
        //you can set your custome url
        vpController.wwwFolderName = @"https://games.gamechanger.studio/develop"];

        [self.navigationController pushViewController:vpController animated:YES];

    }

    @end
    ```
    
## Demo Project

https://github.com/GameChangerInteractive/cordova-wrapper-ios/releases/download/1.0.5/GCCordovaWrapperExample.zip   
    