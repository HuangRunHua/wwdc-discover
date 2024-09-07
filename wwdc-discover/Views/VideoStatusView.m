//
//  VideoStatusView.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "VideoStatusView.h"
#import <Masonry/Masonry.h>

#define EDGE_STANDARD_PADDING 5
#define STOP_IMAGE_WIDTH 8
#define videoStatusViewBackgroundColor @"videoStatusViewBackgroundColor"

@interface VideoStatusView ()
@property (nonatomic, strong) UIImageView *stopImageView;
@property (nonatomic, strong) UILabel *videoStatusLabel;
@end

@implementation VideoStatusView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setUserWatchStatus:(NSString *)userWatchStatus
{
    _userWatchStatus = userWatchStatus;
    _videoStatusLabel.text = userWatchStatus;
}

- (void)setupView
{
    self.backgroundColor = [UIColor colorNamed:videoStatusViewBackgroundColor];
    [self loadStopImageView];
    [self loadVideoStatusLabel];
}

- (void)loadStopImageView
{
    _stopImageView = [[UIImageView alloc] init];
    _stopImageView.image = [UIImage systemImageNamed:@"play.fill"];
    _stopImageView.backgroundColor = [UIColor clearColor];
    _stopImageView.tintColor = [UIColor whiteColor];
    _stopImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:_stopImageView];
    [_stopImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(STOP_IMAGE_WIDTH));
        make.width.equalTo(@(STOP_IMAGE_WIDTH));
        make.top.equalTo(@(EDGE_STANDARD_PADDING));
        make.bottom.equalTo(@(-EDGE_STANDARD_PADDING));
        make.left.equalTo(@(EDGE_STANDARD_PADDING));
    }];
}

- (void)loadVideoStatusLabel
{
    _videoStatusLabel = [[UILabel alloc] init];
    _videoStatusLabel.textColor = [UIColor whiteColor];
    _videoStatusLabel.font = [UIFont systemFontOfSize:10 weight:UIFontWeightSemibold];
    [self addSubview:_videoStatusLabel];
    [_videoStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.stopImageView.mas_right).with.offset(2);
        make.right.equalTo(@(-EDGE_STANDARD_PADDING));
        make.centerY.equalTo(self.stopImageView.mas_centerY);
    }];
}

@end
