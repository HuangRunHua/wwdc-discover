//
//  RecentArticlesTableViewCell.m
//  wwdc-discover
//
//  Created by huangrunhua on 2024/9/7.
//

#import "RecentArticlesTableViewCell.h"
#import <Masonry/Masonry.h>

#define EDGE_STANDARD_PADDING 10
#define CHEVRON_RIGHT_WIDTH 10
#define PADDING_TO_RIGHT_ERROR 7

#define cellDividerColor @"cellDividerColor"
#define cellTagColor @"cellTagColor"
#define cellRightArrorColor @"cellRightArrorColor"

@interface RecentArticlesTableViewCell ()
@property (nonatomic, strong) UIView *backgroundContentView;
@property (nonatomic, strong) UIImageView *articleImageView;
@property (nonatomic, strong) UILabel *articleTagLabel;
@property (nonatomic, strong) UILabel *articleTitleLabel;
@property (nonatomic, strong) UIView *divider;
@property (nonatomic, strong) UIImageView *rightArrorImageView;
@end

@implementation RecentArticlesTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style 
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style 
                reuseIdentifier:reuseIdentifier];
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

- (void)setupView
{
    [self loadBackgroundContentView];
    [self loadRightArrorImageView];
    [self loadArticleImageView];
    [self loadArticleTagLabel];
    [self loadArticleTitleLabel];
    [self loadDivider];
}

- (void)setArticle:(Article *)article
{
    _article = article;
    UIImage *image = [UIImage imageNamed:article.coverImageURL];
    self.articleImageView.image = image;
    [self.articleImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.articleImageView.mas_height).multipliedBy(image.size.width / image.size.height);
    }];
    self.articleTagLabel.text = article.articleTag;
    self.articleTitleLabel.text = article.articleTitle;
}

-(void)loadBackgroundContentView
{
    _backgroundContentView = [[UIView alloc] init];
    [self.contentView addSubview:_backgroundContentView];
    [_backgroundContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 20, 0, 20));
    }];
}

- (void)loadArticleImageView
{
    _articleImageView = [[UIImageView alloc] init];
    _articleImageView.layer.cornerRadius = 5.0;
    _articleImageView.layer.masksToBounds = YES;
    [self.backgroundContentView addSubview:_articleImageView];
    [_articleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(60));
        make.top.equalTo(@(EDGE_STANDARD_PADDING));
        make.left.equalTo(@(0));
        make.bottom.lessThanOrEqualTo(@(-EDGE_STANDARD_PADDING));
    }];
}

- (void)loadArticleTagLabel
{
    _articleTagLabel = [[UILabel alloc] init];
    _articleTagLabel.textColor = [UIColor colorNamed:cellTagColor];
    _articleTagLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightSemibold];
    _articleTagLabel.textAlignment = NSTextAlignmentLeft;
    [self.backgroundContentView addSubview:_articleTagLabel];
    
    [_articleTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.articleImageView.mas_right).with.offset(10);
        make.top.equalTo(@(EDGE_STANDARD_PADDING));
        make.right.equalTo(self.rightArrorImageView.mas_left).with.offset(-PADDING_TO_RIGHT_ERROR);
    }];
}

- (void)loadArticleTitleLabel
{
    _articleTitleLabel = [[UILabel alloc] init];
    _articleTitleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
    _articleTitleLabel.textAlignment = NSTextAlignmentLeft;
    _articleTitleLabel.numberOfLines = 0;
    [self.backgroundContentView addSubview:_articleTitleLabel];
    
    [_articleTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.articleImageView.mas_right).with.offset(10);
        make.top.equalTo(self.articleTagLabel.mas_bottom).with.offset(1);
        make.right.equalTo(self.rightArrorImageView.mas_left).with.offset(-PADDING_TO_RIGHT_ERROR);
        make.bottom.lessThanOrEqualTo(@(-EDGE_STANDARD_PADDING));
    }];
}

- (void)loadDivider
{
    _divider = [[UIView alloc] init];
    _divider.backgroundColor = [UIColor colorNamed:cellDividerColor];
    [self.contentView addSubview:_divider];
    
    [_divider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(0.7));
        make.left.equalTo(self.articleImageView.mas_right).with.offset(EDGE_STANDARD_PADDING);
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
