//
//  WWDCDiscoverAppDelegate.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/6.
//

#import "WWDCDiscoverAppDelegate.h"
#import "DiscoverViewController.h"

@interface WWDCDiscoverAppDelegate ()
{
    UIWindow *window;
}
@end

@implementation WWDCDiscoverAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    DiscoverViewController *dvc = [[DiscoverViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:dvc];
    window.rootViewController = nav;
    [window makeKeyAndVisible];
    return YES;
}
@end
