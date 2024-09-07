//
//  FeaturedVideo.h
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeaturedVideo : NSObject
@property (nonatomic, strong) NSString *videoFrameImageURL;
@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic, strong, nullable) NSString *videoTag;
@property (nonatomic, strong, nullable) NSString *publishDate;
@property (nonatomic, strong, nullable) NSString *userWatchStatus;

- (instancetype)initWithVideoFrameImageURL:(NSString *)videoFrameImageURL
                                videoTitle:(NSString *)videoTitle
                                  videoTag:(nullable NSString *)videoTag
                               publishDate:(nullable NSString *)publishDate
                           userWatchStatus:(nullable NSString *)userWatchStatus;
@end

NS_ASSUME_NONNULL_END
