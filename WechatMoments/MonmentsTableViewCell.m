//
//  MonmentsTableViewCell.m
//  WechatMoments
//
//  Created by 杨明春 on 2020/8/30.
//  Copyright © 2020 ymc. All rights reserved.
//

#import "MonmentsTableViewCell.h"
@interface MonmentsTableViewCell()
@property (nonatomic, strong) UIImageView *iconimgview;
@property (nonatomic, strong) UILabel *namelable;
@property (nonatomic, strong) UILabel *contentlable;
@property (nonatomic, strong) UIView *imagesView;
@property (nonatomic, strong) UIView *commentView;
@end
@implementation MonmentsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.boomLineView = [[UIView alloc] init];
        self.boomLineView.backgroundColor = UIColorFromRGB(0xd3d3d3);
        [self addSubview:self.boomLineView];
        [self.boomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.bottom.equalTo(self).with.offset(0);
            make.height.mas_equalTo(0.5);
        }];
        
        self.iconimgview = [[UIImageView alloc] initWithFrame:CGRectMake(16, 10 , 45, 45)];
        self.iconimgview.layer.cornerRadius = 4;
        self.iconimgview.layer.masksToBounds = YES;
        [self addSubview:self.iconimgview];
        
        
        self.namelable = [[UILabel alloc] init];
        [self addSubview:self.namelable];
        self.namelable.font = [UIFont boldSystemFontOfSize:16];
        self.namelable.textAlignment = NSTextAlignmentLeft;
        self.namelable.textColor = UIColorFromRGB(0x1e90ff);
        [self.namelable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconimgview.mas_right).offset(10);
            make.right.equalTo(self.mas_right).offset(-16);
            make.height.mas_equalTo(18);
            make.top.equalTo(self.mas_top).offset(11);
        }];


        self.contentlable = [[UILabel alloc] init];
        [self addSubview:self.contentlable];
        self.contentlable.numberOfLines = 0;
        self.contentlable.font = [UIFont systemFontOfSize:16];
        self.contentlable.textAlignment = NSTextAlignmentLeft;
        self.contentlable.textColor = UIColorFromRGB(0x333333);
        [self.contentlable mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconimgview.mas_right).offset(10);
            make.right.equalTo(self.mas_right).offset(-16);
            make.top.equalTo(self.namelable.mas_bottom).offset(10);
        }];
        
        [self addSubview:self.imagesView];
        [self.imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconimgview.mas_right).offset(10);
            make.right.equalTo(self.mas_right).offset(-16);
        }];
        
        [self addSubview:self.commentView];
        [self.commentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconimgview.mas_right).offset(10);
            make.right.equalTo(self.mas_right).offset(-16);
        }];
        

    }
    return self;
}

- (void)setModel:(DataListModel *)model {
    _model = model;
    [self.iconimgview sd_setImageWithURL:[NSURL URLWithString:model.sender.avatar]];
    self.namelable.text = model.sender.username;
    self.contentlable.text = model.content;
    [self.contentlable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(model.textHeight);
    }];
    if (model.images.count > 0) {
        self.imagesView.hidden = NO;
        [self.imagesView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(model.imageHeight);
            make.top.equalTo(self.namelable.mas_bottom).offset(20 + model.textHeight);
        }];
        [self addimageviews];
    }else{
        self.imagesView.hidden = YES;
    }
    
    if (model.commentsHeight == 0){
        self.commentView.hidden = YES;
    }else{
        self.commentView.hidden = NO;
        [self.commentView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(model.commentsHeight);
            make.top.equalTo(self.namelable.mas_bottom).offset(30 + model.textHeight + model.imageHeight);
        }];
        [self addcommentviews];
    }
}

- (void)addimageviews {
    [self.imagesView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)]; 
    if (self.model.images.count == 1) {
        UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120 / 9 * 16 , 120)];
        [self.imagesView addSubview:imageview];
        NSDictionary * dic = (NSDictionary *)self.model.images[0];
        [imageview sd_setImageWithURL:[NSURL URLWithString:dic[@"url"]]];
    }else{
        CGFloat wight = (SCREEN_WIDTH - 16 - 45 - 10 - 20 -50) / 3;
        [self.model.images enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIImageView * imageview = [[UIImageView alloc] init];
            [self.imagesView addSubview:imageview];
            NSDictionary * dic = (NSDictionary *)self.model.images[0];
            if (idx < 3){
                imageview.frame = CGRectMake((wight + 5) * idx, 0, wight, wight);
                [imageview sd_setImageWithURL:[NSURL URLWithString:dic[@"url"]]];
            }else if (idx < 6){
                imageview.frame = CGRectMake((wight + 5) * (idx -3), wight + 5, wight, wight);
                [imageview sd_setImageWithURL:[NSURL URLWithString:dic[@"url"]]];
            }else{
                imageview.frame = CGRectMake((wight + 5) * (idx -6), (wight + 5) * 2, wight, wight);
                [imageview sd_setImageWithURL:[NSURL URLWithString:dic[@"url"]]];
            }
        }];
    }
}

- (void)addcommentviews {
    [self.commentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat top = 5;
    for (int i = 0; i < self.model.commentModels.count; i ++) {
                CommentsModel * comodel = self.model.commentModels[i];
        NSString * contents = [NSString stringWithFormat:@"%@: %@",comodel.sender.username,comodel.content];
        NSString * heightstr = self.model.commentHeights[i];
        CGFloat height = [heightstr floatValue];
        UILabel * commentlab = [[UILabel alloc] init];
        [self.commentView addSubview:commentlab];
        commentlab.numberOfLines = 0;
        commentlab.font = [UIFont systemFontOfSize:14];
        commentlab.textAlignment = NSTextAlignmentLeft;
        commentlab.textColor = UIColorFromRGB(0x333333);
        [commentlab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.commentView.mas_left).offset(5);
            make.right.equalTo(self.commentView.mas_right).offset(-5);
            make.height.mas_equalTo(height);
            make.top.equalTo(self.commentView.mas_top).offset(top);
        }];
        NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:contents];
        [noteStr addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(0x1e90ff) range:NSMakeRange(0,comodel.sender.username.length)];
        commentlab.attributedText = noteStr;
        top = top + height + 2;
    }
}

- (UIView *)imagesView {
    if (!_imagesView){
        _imagesView = [[UIView alloc] init];
        _imagesView.backgroundColor = [UIColor clearColor];
        
    }
    return _imagesView;
}

- (UIView *)commentView {
    if (!_commentView){
        _commentView = [[UIView alloc] init];
        _commentView.backgroundColor = UIColorFromRGB(0xf5f5f5);
        _commentView.layer.cornerRadius = 4;
        _commentView.layer.masksToBounds = YES;
    }
    return _commentView;
}

@end
