//
//  WWDCDiscoverAppDelegate.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/6.
//

#import "WWDCDiscoverAppDelegate.h"
#import "DiscoverViewController.h"
#import "WWDCViewController.h"
#import "BrowseViewController.h"
#import "AccountViewController.h"
#import "SearchViewController.h"

@interface WWDCDiscoverAppDelegate ()
{
    UIWindow *window;
    UITabBarController *tabBarController;
}
@end

@implementation WWDCDiscoverAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    DiscoverViewController *dvc = [[DiscoverViewController alloc] init];
    dvc.tabBarItem = [
        [UITabBarItem alloc] initWithTitle:@"Discover"
                                     image:[UIImage systemImageNamed:@"star.fill"]
                                       tag:0
    ];
    UINavigationController *dnav = [[UINavigationController alloc] initWithRootViewController:dvc];
    
    BrowseViewController *bvc = [[BrowseViewController alloc] init];
    bvc.tabBarItem = [
        [UITabBarItem alloc] initWithTitle:@"Browse"
                                     image:[UIImage systemImageNamed:@"rectangle.stack.fill"]
                                       tag:1
    ];
    UINavigationController *bnav = [[UINavigationController alloc] initWithRootViewController:bvc];
    
    WWDCViewController *wvc = [[WWDCViewController alloc] init];
    wvc.tabBarItem = [
        [UITabBarItem alloc] initWithTitle:@"WWDC"
                                     image:[UIImage imageNamed:@"wwdc.badge.fill"]
                                       tag:2
    ];
    UINavigationController *wnav = [[UINavigationController alloc] initWithRootViewController:wvc];
    
    AccountViewController *avc = [[AccountViewController alloc] init];
    avc.tabBarItem = [
        [UITabBarItem alloc] initWithTitle:@"Account"
                                     image:[UIImage systemImageNamed:@"person.crop.circle.fill"]
                                       tag:3
    ];
    UINavigationController *anav = [[UINavigationController alloc] initWithRootViewController:avc];
    
    SearchViewController *svc = [[SearchViewController alloc] init];
    svc.tabBarItem = [
        [UITabBarItem alloc] initWithTitle:@"Search"
                                     image:[UIImage systemImageNamed:@"magnifyingglass"]
                                       tag:4
    ];
    UINavigationController *snav = [[UINavigationController alloc] initWithRootViewController:svc];
    
    tabBarController = [[UITabBarController alloc] init];
    /// 必须写
    tabBarController.viewControllers = @[dnav, bnav, wnav, anav, snav];
    tabBarController.delegate = self;
    
    window.rootViewController = tabBarController;
    [window makeKeyAndVisible];
    return YES;
}
@end
