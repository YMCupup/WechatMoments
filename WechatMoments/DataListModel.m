//
//  DataListModel.m
//  WechatMoments
//
//  Created by 杨明春 on 2020/8/30.
//  Copyright © 2020 ymc. All rights reserved.
//

#import "DataListModel.h"

@implementation DataListModel

- (void)CalculateHeightAndPicture {
    CGFloat wight = SCREEN_WIDTH - 16 - 45 - 10 - 20;
    self.cellHeight = [self getWidthWithTitle:self.content font:[UIFont systemFontOfSize:16] wight:wight] + 20 + 45;
    self.textHeight = [self getWidthWithTitle:self.content font:[UIFont systemFontOfSize:16] wight:wight];
    if (self.images.count > 0){
        if (self.images.count == 1){
            self.imageHeight = 120;
        }else if (self.images.count < 4){
            self.imageHeight = (wight - 50) / 3;
        }else if (self.images.count < 7){
            self.imageHeight = (wight - 50) * 2 / 3;
        }else{
            self.imageHeight = (wight - 50);
        }
    }
    
    self.commentModels = [CommentsModel mj_objectArrayWithKeyValuesArray:self.comments];
    self.commentsHeight = 0;
    self.commentHeights = [NSMutableArray array];
    for (CommentsModel * comodel in self.commentModels) {
        NSString * contents = [NSString stringWithFormat:@"%@:%@",comodel.sender.username,comodel.content];
        CGFloat hight = [self getWidthWithTitle:contents font:[UIFont systemFontOfSize:16] wight:wight - 10];
        self.commentsHeight = self.commentsHeight + hight;
        [self.commentHeights addObject:[NSString stringWithFormat:@"%f",hight]];
    }
    if (self.commentsHeight != 0){
        self.commentsHeight = self.commentsHeight + 15;
    }
    
    self.cellHeight  = self.cellHeight + self.imageHeight + self.commentsHeight;
}

- (CGFloat )getWidthWithTitle:(NSString *)title font:(UIFont *)font wight:(CGFloat )wight{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, wight , 1000)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    return label.frame.size.height;
}

@end
