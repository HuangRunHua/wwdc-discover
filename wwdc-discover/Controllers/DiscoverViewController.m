//
//  DiscoverViewController.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/6.
//

#import "DiscoverViewController.h"
#import "../Views/DiscoverKingKongTableViewCell.h"
#import "../Model/WWDCKingKong.h"
#import <Masonry/Masonry.h>

@interface DiscoverViewController ()
@property (nonatomic, strong) NSArray<WWDCKingKong *> *wwdcKingKongs;

@property (nonatomic, strong) UITableView *kingkongTableView;
@end

@implementation DiscoverViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.wwdcKingKongs = @[
            [[WWDCKingKong alloc] initWithDatePublished:@"SEPTEMBER 2024"
                                                  title:@"Hello Developer"
                                               subtitle:@"Get ready for Apple intelligence, go behind the design with Rytmos, and more"
                                           featureImage:@"wwdc-highlight"
                                             latestNews:nil
                                               cellType: DiscoverKingKongTableViewCellTypeLarge],
            [[WWDCKingKong alloc] initWithDatePublished:nil
                                                  title:@"Explore new documentation"
                                               subtitle:@"Browse new and updated documentation for technologies, frameworks, and APIs."
                                           featureImage:nil
                                             latestNews:nil
                                               cellType: DiscoverKingKongTableViewCellTypeMedium],
            [[WWDCKingKong alloc] initWithDatePublished:nil
                                                  title:@"Price and tax updates for apps, In-App Purchases, and subscriptions"
                                               subtitle:nil
                                           featureImage:nil
                                             latestNews:nil
                                               cellType: DiscoverKingKongTableViewCellTypeSmall],
        ];
    }
    return self;
}

- (void)loadView
{
    self.title = @"Discover";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.kingkongTableView = [[UITableView alloc] init];
    self.kingkongTableView.delegate = self;
    self.kingkongTableView.dataSource = self;
    self.kingkongTableView.estimatedRowHeight = 100;
    self.kingkongTableView.rowHeight = UITableViewAutomaticDimension;
    self.kingkongTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.kingkongTableView registerClass:[DiscoverKingKongTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.kingkongTableView];
    [self.kingkongTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(12);
        make.right.equalTo(self.view).with.offset(-12);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

- (DiscoverKingKongTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiscoverKingKongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                                          forIndexPath:indexPath];
    
    cell.wwdcKingKong = self.wwdcKingKongs[indexPath.item];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wwdcKingKongs.count;
}

@end
