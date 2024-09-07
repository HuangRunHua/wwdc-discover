//
//  FeaturedVideo.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "FeaturedVideo.h"

@implementation FeaturedVideo
- (instancetype)initWithVideoFrameImageURL:(NSString *)videoFrameImageURL
                                videoTitle:(NSString *)videoTitle
                                  videoTag:(nullable NSString *)videoTag
                               publishDate:(nullable NSString *)publishDate
{
    self = [super init];
    if (self) {
        _videoFrameImageURL = videoFrameImageURL;
        _videoTitle = videoTitle;
        _videoTag = videoTag;
        _publishDate = publishDate;
    }
    return self;
}
@end
