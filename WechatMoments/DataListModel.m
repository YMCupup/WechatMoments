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
    self.cellHeight = [self getWidthWithTitle:self.content font:[UIFont systemFontOfSize:16] wight:SCREEN_WIDTH - 16 - 45 - 10 - 20] + 20 + 45;
    if (self.images.count > 0){
        if (self.images.count == 1){
            self.imageHeight = 150;
        }else if (self.images.count < 4){
            self.imageHeight = 100;
        }else if (self.images.count < 7){
            self.imageHeight = 200;
        }else{
            self.imageHeight = 300;
        }
    }
    self.cellHeight  = self.cellHeight + self.imageHeight;
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
