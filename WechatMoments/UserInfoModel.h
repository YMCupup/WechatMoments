//
//  UserInfoModel.h
//  WechatMoments
//
//  Created by 杨明春 on 2020/8/30.
//  Copyright © 2020 ymc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoModel : NSObject
@property (nonatomic ,copy)NSString *profileimage;
@property (nonatomic ,copy)NSString *avatar;
@property (nonatomic ,copy)NSString *nick;
@property (nonatomic ,copy)NSString *username;
@end

NS_ASSUME_NONNULL_END
