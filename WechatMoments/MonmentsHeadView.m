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
    
    [self.iconimageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-16);
        make.bottom.equalTo(self.mas_bottom).with.offset(16);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    
    [self.namelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.iconimageview.mas_left).with.offset(-20);
        make.bottom.equalTo(self.mas_bottom).with.offset(-16);
        make.height.mas_equalTo(20);
    }];
    
}

- (UIImageView *)blackimageview {
    if (!_blackimageview){
        _blackimageview = [[UIImageView alloc] initWithFrame:self.frame];
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
        _namelable.textColor = UIColorFromRGB(0x999999);
        _namelable.textAlignment = NSTextAlignmentRight;
        _namelable.font = [UIFont boldSystemFontOfSize:16];
    }
    return _namelable;
}

@end
