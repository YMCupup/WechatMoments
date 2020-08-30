//
//  DataListModel.h
//  WechatMoments
//
//  Created by 杨明春 on 2020/8/30.
//  Copyright © 2020 ymc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
#import "CommentsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DataListModel : NSObject
@property (nonatomic ,copy)NSString *content;
@property (nonatomic ,strong)NSArray *images;
@property (nonatomic ,strong)UserInfoModel *sender;
@property (nonatomic ,strong)NSArray *comments;

@property (nonatomic ,assign)CGFloat cellHeight;
@property (nonatomic ,assign)CGFloat imageHeight;
- (void)CalculateHeightAndPicture;
@end

NS_ASSUME_NONNULL_END
