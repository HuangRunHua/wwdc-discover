//
//  BrowseViewController.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "BrowseViewController.h"

@interface BrowseViewController ()

@end

@implementation BrowseViewController

- (void)loadView
{
    self.title = @"Browse";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    /// 设置Tab Bar Item
    self.tabBarItem = [
        [UITabBarItem alloc] initWithTitle:self.title
                                     image:[UIImage systemImageNamed:@"rectangle.stack.fill"]
                                       tag:1
    ];
}

@end
