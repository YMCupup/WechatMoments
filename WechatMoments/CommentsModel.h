//
//  CommentsModel.h
//  WechatMoments
//
//  Created by 杨明春 on 2020/8/30.
//  Copyright © 2020 ymc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommentsModel : NSObject
@property (nonatomic ,copy)NSString *content;
@property (nonatomic ,strong)UserInfoModel *sender;
@end

NS_ASSUME_NONNULL_END
