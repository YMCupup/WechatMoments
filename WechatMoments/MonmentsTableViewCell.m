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

    }
    return self;
}

- (void)setModel:(DataListModel *)model {
    _model = model;
    [self.iconimgview sd_setImageWithURL:[NSURL URLWithString:model.sender.avatar]];
    self.namelable.text = model.sender.username;
    self.contentlable.text = model.content;
    if (model.images.count > 0) {
        self.imagesView.hidden = NO;
        [self.imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconimgview.mas_right).offset(10);
            make.right.equalTo(self.mas_right).offset(-16);
            make.height.mas_equalTo(model.imageHeight);
            if (model.content){
                make.top.equalTo(self.contentlable.mas_bottom).offset(10);
            }else{
                make.top.equalTo(self.namelable.mas_bottom).offset(10);
            }
        }];
        [self addimageviews];
    }else{
        self.imagesView.hidden = YES;
    }
}

- (void)addimageviews {
    if (self.model.images.count == 1) {
        UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150 / 9 * 16 , 150)];
        [self.imagesView addSubview:imageview];
        NSDictionary * dic = (NSDictionary *)self.model.images[0];
        [imageview sd_setImageWithURL:[NSURL URLWithString:dic[@"url"]]];
    }else{
        [self.model.images enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
        }];
    }
}

- (UIView *)imagesView {
    if (!_imagesView){
        _imagesView = [[UIView alloc] init];
        _imagesView.backgroundColor = [UIColor clearColor];
        [self addSubview:_imagesView];
    }
    return _imagesView;
}

@end
