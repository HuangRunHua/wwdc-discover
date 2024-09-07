//
//  Article.h
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Article : NSObject
@property (nonatomic, strong) NSString *coverImageURL;
@property (nonatomic, strong) NSString *articleTag;
@property (nonatomic, strong) NSString *articleTitle;

- (instancetype)initWithcoverImageURL:(NSString *)coverImageURL
                           articleTag:(NSString *)articleTag
                         articleTitle:(NSString *)articleTitle;
@end

NS_ASSUME_NONNULL_END
