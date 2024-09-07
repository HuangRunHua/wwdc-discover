//
//  RecentArticlesTableViewCell.h
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import <UIKit/UIKit.h>
#import "Article.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecentArticlesTableViewCell : UITableViewCell
@property (nonatomic, strong) Article *article;
@end

NS_ASSUME_NONNULL_END
