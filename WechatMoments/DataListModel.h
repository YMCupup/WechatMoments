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
@property (nonatomic ,strong)NSArray *commentModels;
@property (nonatomic ,strong)NSMutableArray *commentHeights;

@property (nonatomic ,assign)CGFloat cellHeight;
@property (nonatomic ,assign)CGFloat textHeight;
@property (nonatomic ,assign)CGFloat imageHeight;
@property (nonatomic ,assign)CGFloat commentsHeight;
- (void)CalculateHeightAndPicture;
@end

NS_ASSUME_NONNULL_END
