//
//  MonmentsTableViewCell.h
//  WechatMoments
//
//  Created by 杨明春 on 2020/8/30.
//  Copyright © 2020 ymc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MonmentsTableViewCell : UITableViewCell
@property (nonatomic, strong) UIView *boomLineView;
@property (nonatomic, strong) DataListModel *model;
@end

NS_ASSUME_NONNULL_END
