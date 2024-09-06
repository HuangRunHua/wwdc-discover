//
//  WWDCKingKong.h
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/6.
//

#import <Foundation/Foundation.h>
#import "DiscoverKingKongTableViewCellType.h"

NS_ASSUME_NONNULL_BEGIN

@interface WWDCKingKong : NSObject
@property (nonatomic, strong, nullable) NSString *datePublished;
@property (nonatomic, strong, nullable) NSString *title;
@property (nonatomic, strong, nullable) NSString *subtitle;
@property (nonatomic, strong, nullable) NSString *featureImage;
@property (nonatomic, assign) DiscoverKingKongTableViewCellType cellType;

- (instancetype)initWithDatePublished:(nullable NSString *)datePublished
                                title:(nullable NSString *)title
                             subtitle:(nullable NSString *)subtitle
                         featureImage:(nullable NSString *)featureImage
                             cellType:(DiscoverKingKongTableViewCellType)cellType;
@end

NS_ASSUME_NONNULL_END
