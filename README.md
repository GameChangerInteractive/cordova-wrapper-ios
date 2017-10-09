# wrapper-ios
:iphone: native cordova-enabled ios webview that wraps our website

# How to import on your project.

You can import this easily to your project.

# 1. on your AppDelegate.h

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

#import "CDVAppDelegate.h"

@interface AppDelegate : CDVAppDelegate

//@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

-(void)saveContext;

@end


# 2. on your AppDelegate.m

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.window.rootViewController = ([storyboard instantiateViewControllerWithIdentifier:@"startNavigationViewController"]);
    
    return YES;
}

# 3. on your ViewController.m
----

#import "ViewController.h"

#import "GcmvpCordovaViewController.h"

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

    GcmvpCordovaViewController *vpController = [[GcmvpCordovaViewController alloc] init];
    //you can set your custome url
    [vpController setWwwFolderName:@"https://games.gamechanger.studio/develop"];
    
    [self.navigationController pushViewController:vpController animated:YES];
    
}

@end

# Tutorial
----

<a href="http://www.youtube.com/watch?feature=player_embedded&v=bbP4V-B-Rqc
" target="_blank"><img src="http://img.youtube.com/vi/bbP4V-B-Rqc/0.jpg" 
alt="example" width="240" height="180" border="10" /></a>