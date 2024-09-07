//
//  WWDCViewController.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "WWDCViewController.h"

@interface WWDCViewController ()

@end

@implementation WWDCViewController

- (void)loadView
{
    self.title = @"WWDC";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
