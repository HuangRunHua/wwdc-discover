//
//  FeaturedVideoTableViewCell.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "FeaturedVideoTableViewCell.h"
#import "VideoStatusView.h"
#import <Masonry/Masonry.h>

#define EDGE_STANDARD_PADDING 10
#define CHEVRON_RIGHT_WIDTH 10
#define PADDING_TO_RIGHT_ERROR 7

#define kingkongLargeBackgroundColor @"kingkongLargeBackgroundColor"
#define kingkongMediumBackgroundColor @"kingkongMediumBackgroundColor"
#define kingkongSmallBackgroundColor @"kingkongSmallBackgroundColor"
#define kingkongLargeTextColor @"kingkongLargeTextColor"
#define cellDividerColor @"cellDividerColor"
#define cellSubtitleColor @"cellSubtitleColor"
#define cellTagColor @"cellTagColor"
#define cellRightArrorColor @"cellRightArrorColor"

@interface FeaturedVideoTableViewCell ()
@property (nonatomic, strong) UIView *backgroundContentView;
@property (nonatomic, strong) UIImageView *videoImageView;
@property (nonatomic, strong) VideoStatusView *videoStatusView;
@property (nonatomic, strong) UILabel *videoTagLabel;
@property (nonatomic, strong) UILabel *videoTitleLabel;
@property (nonatomic, strong) UILabel *videoPublishedDateLabel;
@property (nonatomic, strong) UIView *divider;
@property (nonatomic, strong) UIImageView *rightArrorImageView;

@end

@implementation FeaturedVideoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)awakeFromNib 
{
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setupView
{
    [self loadBackgroundContentView];
    [self loadRightArrorImageView];
    [self loadVideoImageView];
    [self loadVideoStatusView];
    [self loadVideoTagLabel];
    [self loadVideoTitleLabel];
    [self loadVideoPublishedDateLabel];
    [self loadDivider];
}

- (void)setFeaturedVideo:(FeaturedVideo *)featuredVideo
{
    _featuredVideo = featuredVideo;
    if (!featuredVideo.videoTag) {
        [self.videoTagLabel removeFromSuperview];
    }
    if (!featuredVideo.publishDate) {
        [self.videoPublishedDateLabel removeFromSuperview];
    }
    UIImage *image = [UIImage imageNamed:featuredVideo.videoFrameImageURL];
    self.videoImageView.image = image;
    [self.videoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.videoImageView.mas_height).multipliedBy(image.size.width / image.size.height);
    }];
    self.videoTagLabel.text = featuredVideo.videoTag;
    self.videoTitleLabel.text = featuredVideo.videoTitle;
    self.videoPublishedDateLabel.text = featuredVideo.publishDate;
    [self.videoStatusView setUserWatchStatus:featuredVideo.userWatchStatus];
}

-(void)loadBackgroundContentView
{
    _backgroundContentView = [[UIView alloc] init];
    [self.contentView addSubview:_backgroundContentView];
    [_backgroundContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 20, 0, 20));
    }];
}

- (void)loadVideoImageView
{
    _videoImageView = [[UIImageView alloc] init];
    _videoImageView.layer.cornerRadius = 5.0;
    _videoImageView.layer.masksToBounds = YES;
    [self.backgroundContentView addSubview:_videoImageView];
    [_videoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(60));
        make.top.equalTo(@(EDGE_STANDARD_PADDING));
        make.left.equalTo(@(0));
        make.bottom.equalTo(@(-EDGE_STANDARD_PADDING));
    }];
}

- (void)loadVideoStatusView
{
    _videoStatusView = [[VideoStatusView alloc] init];
    _videoStatusView.layer.masksToBounds = YES;
    _videoStatusView.layer.cornerRadius = 3.0;
    [self.videoImageView addSubview:_videoStatusView];
    [_videoStatusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-4));
        make.bottom.equalTo(@(-4));
    }];
}

- (void)loadVideoTagLabel
{
    _videoTagLabel = [[UILabel alloc] init];
    _videoTagLabel.textColor = [UIColor colorNamed:cellTagColor];
    _videoTagLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightSemibold];
    _videoTagLabel.textAlignment = NSTextAlignmentLeft;
    [self.backgroundContentView addSubview:_videoTagLabel];
    
    [_videoTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.videoImageView.mas_right).with.offset(10);
        make.top.equalTo(@(EDGE_STANDARD_PADDING));
        make.right.equalTo(self.rightArrorImageView.mas_left).with.offset(-PADDING_TO_RIGHT_ERROR);
    }];
}

- (void)loadVideoTitleLabel
{
    _videoTitleLabel = [[UILabel alloc] init];
    _videoTitleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
    _videoTitleLabel.textAlignment = NSTextAlignmentLeft;
    _videoTitleLabel.numberOfLines = 0;
    [self.backgroundContentView addSubview:_videoTitleLabel];
    
    [_videoTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.videoImageView.mas_right).with.offset(10);
        make.top.equalTo(@(EDGE_STANDARD_PADDING)).priorityMedium();
        make.top.equalTo(self.videoTagLabel.mas_bottom).with.offset(1).priorityHigh();
        make.right.equalTo(self.rightArrorImageView.mas_left).with.offset(-PADDING_TO_RIGHT_ERROR);
    }];
}

- (void)loadVideoPublishedDateLabel
{
    _videoPublishedDateLabel = [[UILabel alloc] init];
    _videoPublishedDateLabel.font = [UIFont systemFontOfSize:12];
    _videoPublishedDateLabel.textAlignment = NSTextAlignmentLeft;
    _videoPublishedDateLabel.numberOfLines = 0;
    _videoPublishedDateLabel.textColor = [UIColor colorNamed:cellSubtitleColor];
    [self.backgroundContentView addSubview:_videoPublishedDateLabel];
    
    [_videoPublishedDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.videoImageView.mas_right).with.offset(10);
        make.top.equalTo(self.videoTitleLabel.mas_bottom).with.offset(1);
        make.right.equalTo(self.rightArrorImageView.mas_left).with.offset(-PADDING_TO_RIGHT_ERROR);
    }];
}

- (void)loadDivider
{
    _divider = [[UIView alloc] init];
    _divider.backgroundColor = [UIColor colorNamed:cellDividerColor];
    [self.contentView addSubview:_divider];
    
    [_divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(0.7));
        make.left.equalTo(self.videoImageView.mas_right).with.offset(EDGE_STANDARD_PADDING);
        make.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView);
    }];
}

- (void)loadRightArrorImageView
{
    _rightArrorImageView = [[UIImageView alloc] init];
    _rightArrorImageView.tintColor = [UIColor colorNamed:cellRightArrorColor];
    _rightArrorImageView.image = [UIImage systemImageNamed:@"chevron.right"];
    _rightArrorImageView.backgroundColor = [UIColor clearColor];
    _rightArrorImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.backgroundContentView addSubview:_rightArrorImageView];
    [_rightArrorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(CHEVRON_RIGHT_WIDTH));
        make.width.equalTo(@(CHEVRON_RIGHT_WIDTH));
        make.right.equalTo(@(-EDGE_STANDARD_PADDING));
        make.centerY.equalTo(self.backgroundContentView.mas_centerY);
    }];
}

@end
