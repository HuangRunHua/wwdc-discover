//
//  VideoStatusView.h
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoStatusView : UIView
@property (nonatomic, strong) NSString *userWatchStatus;

- (void)setUserWatchStatus:(NSString *)userWatchStatus;
@end

NS_ASSUME_NONNULL_END
