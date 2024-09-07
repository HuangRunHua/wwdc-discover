//
//  DiscoverViewController.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/6.
//

#import <Masonry/Masonry.h>
#import "DiscoverViewController.h"
#import "DiscoverKingKongTableViewCell.h"
#import "FeaturedVideoTableViewCell.h"
#import "RecentArticlesTableViewCell.h"
#import "WWDCKingKong.h"
#import "FeaturedVideo.h"
#import "Article.h"

#define kingKongCellReuseIdentifier @"kingKongCell"
#define featuredVideoCellReuseIdentifier @"featuredVideoCell"
#define recentArticleCellReuseIdentifier @"recentArticleCell"

@interface DiscoverViewController ()
@property (nonatomic, strong) NSArray<WWDCKingKong *> *wwdcKingKongs;
@property (nonatomic, strong) NSArray<FeaturedVideo *> *featuredVideos;
@property (nonatomic, strong) NSArray<Article *> *recentArticles;

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
                                               subtitle:@"Get ready for Apple intelligence, go behind the design with Rytmos, and more."
                                           featureImage:@"wwdc-highlight"
                                               cellType: DiscoverKingKongTableViewCellTypeLarge],
            [[WWDCKingKong alloc] initWithDatePublished:nil
                                                  title:@"Explore new documentation"
                                               subtitle:@"Browse new and updated documentation for technologies, frameworks, and APIs."
                                           featureImage:nil
                                               cellType: DiscoverKingKongTableViewCellTypeMedium],
            [[WWDCKingKong alloc] initWithDatePublished:nil
                                                  title:@"Price and tax updates for apps, In-App Purchases, and subscriptions"
                                               subtitle:nil
                                           featureImage:nil
                                               cellType: DiscoverKingKongTableViewCellTypeSmall],
        ];
        
        self.featuredVideos = @[
            [[FeaturedVideo alloc] initWithVideoFrameImageURL:@"keynote"
                                                   videoTitle:@"Keynote"
                                                     videoTag:nil
                                                  publishDate:@"June 11, 2024·01:00-03:00"],
            [[FeaturedVideo alloc] initWithVideoFrameImageURL:@"18-things"
                                                   videoTitle:@"18 things from WWDC24"
                                                     videoTag:@"WWDC24"
                                                  publishDate:nil],
            [[FeaturedVideo alloc] initWithVideoFrameImageURL:@"platforms-state-of-the-union"
                                                   videoTitle:@"Platforms State of the Union"
                                                     videoTag:nil
                                                  publishDate:@"June 11, 2024·04:00-05:00"],
            [[FeaturedVideo alloc] initWithVideoFrameImageURL:@"platforms-state-of-the-union-5-Minute-recap"
                                                   videoTitle:@"Platforms State of the Union 5-Minute Recap"
                                                     videoTag:@"WWDC24"
                                                  publishDate:nil],
        ];
        
        self.recentArticles = @[
            [[Article alloc] initWithcoverImageURL:@"hello-developer"
                                        articleTag:@"Articles"
                                      articleTitle:@"Hello Developer: September 2024"],
            [[Article alloc] initWithcoverImageURL:@"behind-the-design"
                                        articleTag:@"Articles"
                                      articleTitle:@"Behind the Design: The rhythms of Rytmos"],
            [[Article alloc] initWithcoverImageURL:@"hello-developer-august-2024"
                                        articleTag:@"Articles"
                                      articleTitle:@"Hello Developer: August 2024"],
            [[Article alloc] initWithcoverImageURL:@"creating-the-make-believe-magic-of-lost-in-play"
                                        articleTag:@"Articles"
                                      articleTitle:@"Behind the Design: Creating the make-believe magic of Lost in Play"],
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
    [self.kingkongTableView registerClass:[DiscoverKingKongTableViewCell class] forCellReuseIdentifier:kingKongCellReuseIdentifier];
    [self.kingkongTableView registerClass:[FeaturedVideoTableViewCell class] forCellReuseIdentifier:featuredVideoCellReuseIdentifier];
    [self.kingkongTableView registerClass:[RecentArticlesTableViewCell class] forCellReuseIdentifier:recentArticleCellReuseIdentifier];
    [self.view addSubview:self.kingkongTableView];
    [self.kingkongTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        DiscoverKingKongTableViewCell *cell = [
            tableView dequeueReusableCellWithIdentifier:kingKongCellReuseIdentifier
                                           forIndexPath:indexPath];
        
        cell.wwdcKingKong = self.wwdcKingKongs[indexPath.item];
        return cell;
    } else if (indexPath.section == 1) {
        FeaturedVideoTableViewCell *cell = [
            tableView dequeueReusableCellWithIdentifier:featuredVideoCellReuseIdentifier
                                           forIndexPath:indexPath];
        cell.featuredVideo = self.featuredVideos[indexPath.item];
        return cell;
    } else if (indexPath.section == 2) {
        RecentArticlesTableViewCell *cell = [
            tableView dequeueReusableCellWithIdentifier:recentArticleCellReuseIdentifier
                                           forIndexPath:indexPath];
        cell.article = self.recentArticles[indexPath.item];
        return cell;
    } else {
        UITableViewCell *cell = [
            tableView dequeueReusableCellWithIdentifier:@"cell"
                                           forIndexPath:indexPath];
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return self.wwdcKingKongs.count;
    } else if (section == 1) {
        return self.featuredVideos.count;
    } else if (section == 2) {
        return self.recentArticles.count;
    } else {
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *headrView = [[UIView alloc] init];
        UILabel *label = [[UILabel alloc] init];
        label.text = @"WWDC24";
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont boldSystemFontOfSize:20];
        [headrView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(20));
        }];
        return headrView;
    } else if (section == 2) {
        UIView *headrView = [[UIView alloc] init];
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Recent articles";
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont boldSystemFontOfSize:20];
        [headrView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@(20));
        }];
        return headrView;
    } else {
        UIView *headerView = [[UIView alloc] init];
        headerView.backgroundColor = [UIColor clearColor];
        return headerView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section
{
    if (section == 1 || section == 2) {
        return 10.f;
    } else {
        return 0.f;
    }
}

@end
