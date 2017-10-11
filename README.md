# wrapper-ios v1.0.0
:iphone: native cordova-enabled ios webview that wraps our website

# How to import on your project.

You can import this easily to your project.

# 1. on your AppDelegate.h
```
#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

#import "GcmvpCDVAppDelegate.h"

@interface AppDelegate : GcmvpCDVAppDelegate

//@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

-(void)saveContext;

@end
```

# 2. on your AppDelegate.m
```
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.window.rootViewController = ([storyboard instantiateViewControllerWithIdentifier:@"startNavigationViewController"]);
    
    return YES;
}
```
# 3. on your ViewController.m
```
#import "ViewController.h"

#import "GcmvpCordovaWebViewController.h"

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

    GcmvpCordovaWebViewController *vpController = [[GcmvpCordovaWebViewController alloc] init];
    //you can set your custome url
    [vpController setWwwFolderName:@"https://games.gamechanger.studio/develop"];
    
    [self.navigationController pushViewController:vpController animated:YES];
    
}

@end
```
# Tutorial
----

https://drive.google.com/file/d/0B_15pzxptlunQjIyMmQ4WThncEE/view?usp=sharing
