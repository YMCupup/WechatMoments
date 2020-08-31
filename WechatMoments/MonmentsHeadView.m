//// MonmentsHeadView.m
// WechatMoments
//
// Copyright © 2020 ymc. All rights reserved.
//


#import "MonmentsHeadView.h"
@interface MonmentsHeadView()
@property (nonatomic, strong) UIImageView *blackimageview;
@property (nonatomic, strong) UILabel *namelable;
@property (nonatomic, strong) UIImageView *iconimageview;
@end
@implementation MonmentsHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupmainview];
    }
    return self;
}

- (void)setupmainview {
    [self addSubview:self.blackimageview];
    [self addSubview:self.namelable];
    [self addSubview:self.iconimageview];
    
    [self.blackimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.equalTo(self).with.offset(0);
        make.height.mas_equalTo(250);
    }];
    
    [self.iconimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-6);
        make.bottom.equalTo(self.blackimageview.mas_bottom).with.offset(26);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(80);
    }];
    
    [self.namelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.iconimageview.mas_left).with.offset(-10);
        make.bottom.equalTo(self.blackimageview.mas_bottom).with.offset(-10);
        make.height.mas_equalTo(20);
    }];
    
}


- (void)setModel:(UserInfoModel *)model {
    [self.blackimageview sd_setImageWithURL:[NSURL URLWithString:model.profileimage]];
    [self.iconimageview sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    self.namelable.text = model.username;
}

- (UIImageView *)blackimageview {
    if (!_blackimageview){
        _blackimageview = [[UIImageView alloc] init];
    }
    return _blackimageview;
}

- (UIImageView *)iconimageview {
    if (!_iconimageview){
        _iconimageview = [[UIImageView alloc] init];
    }
    return _iconimageview;
}

- (UILabel *)namelable {
    if (!_namelable){
        _namelable = [[UILabel alloc] init];
        _namelable.backgroundColor = [UIColor clearColor];
        _namelable.textColor = UIColorFromRGB(0xffffff);
        _namelable.textAlignment = NSTextAlignmentRight;
        _namelable.font = [UIFont boldSystemFontOfSize:16];
    }
    return _namelable;
}

@end
