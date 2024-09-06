//
//  WWDCKingKong.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/6.
//

#import "WWDCKingKong.h"

@implementation WWDCKingKong

- (instancetype)initWithDatePublished:(nullable NSString *)datePublished
                                title:(nullable NSString *)title
                             subtitle:(nullable NSString *)subtitle
                         featureImage:(nullable NSString *)featureImage
                             cellType:(DiscoverKingKongTableViewCellType)cellType
{
    self = [super init];
    if (self) {
        _datePublished = datePublished;
        _title = title;
        _subtitle = subtitle;
        _featureImage = featureImage;
        _cellType = cellType;
    }
    return self;
}

@end
