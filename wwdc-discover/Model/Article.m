//
//  Article.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "Article.h"

@implementation Article
- (instancetype)initWithcoverImageURL:(NSString *)coverImageURL
                           articleTag:(NSString *)articleTag
                         articleTitle:(NSString *)articleTitle
{
    self = [super init];
    if (self) {
        _coverImageURL = coverImageURL;
        _articleTag = articleTag;
        _articleTitle = articleTitle;
    }
    return self;
}
@end
