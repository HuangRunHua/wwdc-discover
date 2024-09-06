//
//  DiscoverKingKongTableViewCell.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/6.
//

#import "DiscoverKingKongTableViewCell.h"
#import "../Model/DiscoverKingKongTableViewCellType.h"
#import <Masonry/Masonry.h>

#define kingkongLargeBackgroundColor @"kingkongLargeBackgroundColor"
#define kingkongMediumBackgroundColor @"kingkongMediumBackgroundColor"
#define kingkongSmallBackgroundColor @"kingkongSmallBackgroundColor"
#define kingkongLargeTextColor @"kingkongLargeTextColor"

#define INSIDE_PADDING 14

@interface DiscoverKingKongTableViewCell ()
@property (nonatomic, strong, nullable) UIImageView *featureImageView;
@property (nonatomic, strong, nullable) UILabel *dateLabel;
@property (nonatomic, strong, nullable) UILabel *titleLabel;
@property (nonatomic, strong, nullable) UILabel *subtitleLabel;
@property (nonatomic, strong, nullable) UILabel *latestNewsLabel;

@property (nonatomic, strong) UIView *backgroundContentView;

@end

@implementation DiscoverKingKongTableViewCell

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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{
    [super setSelected:selected animated:animated];
}

- (void)setWwdcKingKong:(WWDCKingKong *)wwdcKingKong
{
    _wwdcKingKong = wwdcKingKong;
    
    if (self.wwdcKingKong.cellType == DiscoverKingKongTableViewCellTypeLarge) {
        UIImage *image = [UIImage imageNamed:self.wwdcKingKong.featureImage];
        _featureImageView.image = image;
        [self.featureImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.featureImageView.mas_width).multipliedBy(image.size.height / image.size.width);
        }];
        _dateLabel.text = self.wwdcKingKong.datePublished;
        _titleLabel.text = self.wwdcKingKong.title;
        _titleLabel.font = [UIFont boldSystemFontOfSize: 25];
        _subtitleLabel.text = self.wwdcKingKong.subtitle;
        _subtitleLabel.textColor = [UIColor colorNamed:kingkongLargeTextColor];
        _backgroundContentView.backgroundColor = [UIColor colorNamed:kingkongLargeBackgroundColor];
    } else if (self.wwdcKingKong.cellType == DiscoverKingKongTableViewCellTypeMedium) {
        [_featureImageView removeFromSuperview];
        [_dateLabel removeFromSuperview];
        _titleLabel.text = self.wwdcKingKong.title;
        _titleLabel.font = [UIFont boldSystemFontOfSize: 20];
        _subtitleLabel.text = self.wwdcKingKong.subtitle;
        _backgroundContentView.backgroundColor = [UIColor colorNamed:kingkongMediumBackgroundColor];
    } else {
        [_subtitleLabel removeFromSuperview];
        [_featureImageView removeFromSuperview];
        [_dateLabel removeFromSuperview];
        _titleLabel.font = [UIFont systemFontOfSize: 20];
        NSString *prefix = @"Latest news: ";
        NSString *fullText = [NSString stringWithFormat:@"%@%@", prefix, self.wwdcKingKong.title];
        NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:fullText];
        [attributedText addAttribute:NSFontAttributeName
                               value:[UIFont boldSystemFontOfSize:20]
                               range:NSMakeRange(0, prefix.length)];
        _titleLabel.attributedText = attributedText;
        _backgroundContentView.backgroundColor = [UIColor colorNamed:kingkongSmallBackgroundColor];
    }
}

#pragma mark -
#pragma mark *** UI Setup ***

- (void)setupView
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self loadBackgroundContentView];
    [self loadTitleLabel];
    [self loadSubtitleLabel];
    [self loadDateLabel];
    [self loadFeatureImageView];
    
    [self setupFeatureImageViewConstraints];
    [self setupDateLabelConstraints];
    [self setupTitleLabelConstraints];
    [self setupSubtitleLabelConstraints];
}

- (void)loadBackgroundContentView
{
    _backgroundContentView = [[UIView alloc] init];
    _backgroundContentView.layer.masksToBounds = YES;
    _backgroundContentView.layer.cornerRadius = 10.0;
    [self.contentView addSubview:_backgroundContentView];
    
    [_backgroundContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

-(void)loadFeatureImageView
{
    _featureImageView = [[UIImageView alloc] init];
    _featureImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.backgroundContentView addSubview:_featureImageView];
}

- (void)setupFeatureImageViewConstraints
{
    [self.featureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(0));
        make.right.equalTo(@(0));
        make.top.equalTo(@(0));
    }];
}

- (void)loadDateLabel
{
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.textAlignment = NSTextAlignmentLeft;
    _dateLabel.textColor = [UIColor colorNamed:kingkongLargeTextColor];
    _dateLabel.font = [UIFont systemFontOfSize: 15 weight:UIFontWeightSemibold];
    [self.backgroundContentView addSubview:_dateLabel];
}

- (void)setupDateLabelConstraints
{
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(INSIDE_PADDING));
        make.right.equalTo(@(-INSIDE_PADDING));
        make.top.equalTo(@(INSIDE_PADDING)).priorityMedium();
        make.top.equalTo(self.featureImageView.mas_bottom).with.offset(12.0).priorityHigh();
    }];
}

- (void)loadTitleLabel
{
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.numberOfLines = 0;
    [self.backgroundContentView addSubview:self.titleLabel];
}

- (void)setupTitleLabelConstraints
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(INSIDE_PADDING));
        make.right.equalTo(@(-INSIDE_PADDING));
        make.top.equalTo(self.dateLabel.mas_bottom).with.offset(10).priorityHigh();
        make.top.equalTo(@(INSIDE_PADDING)).priorityMedium();
        make.bottom.equalTo(self.subtitleLabel.mas_top).with.offset(-10).priorityHigh();
        make.bottom.equalTo(@(-INSIDE_PADDING)).priorityMedium();
    }];
}

- (void)loadSubtitleLabel
{
    _subtitleLabel = [[UILabel alloc] init];
    _subtitleLabel.textAlignment = NSTextAlignmentLeft;
    _subtitleLabel.font = [UIFont systemFontOfSize:17];
    _subtitleLabel.textColor = [UIColor grayColor];
    _subtitleLabel.numberOfLines = 0;
    [self.backgroundContentView addSubview:self.subtitleLabel];
}

- (void)setupSubtitleLabelConstraints
{
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backgroundContentView.mas_left).with.offset(INSIDE_PADDING);
        make.right.equalTo(self.backgroundContentView.mas_right).with.offset(-INSIDE_PADDING);
        make.bottom.equalTo(self.backgroundContentView.mas_bottom).with.offset(-INSIDE_PADDING);
    }];
}

@end
