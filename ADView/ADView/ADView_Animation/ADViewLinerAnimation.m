//
//  ADViewLinerAnimation.m
//  ADView
//
//  Created by yangsen on 16/10/31.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import "ADViewLinerAnimation.h"
@interface ADViewLinerAnimation()

@property(copy, nonatomic) dispatch_block_t complete;

@end
@implementation ADViewLinerAnimation

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView duration:(CGFloat)duration completion:(dispatch_block_t)complete{
    _complete = complete;
    
    fromView.frame = toView.frame;
    CGRect fromViewFrame2;
    // 左
    if (self.slideToItem + self.slideDirection == 10) {
        toView.x = -toView.width;
        fromViewFrame2 = CGRectMake(fromView.width, fromView.y, fromView.width, fromView.height);
    } // 右
    else if (self.slideToItem + self.slideDirection == 11) {
        toView.x = toView.width;
        fromViewFrame2 = CGRectMake(-fromView.width, fromView.y, fromView.width, fromView.height);
    }// 上
    else if (self.slideToItem + self.slideDirection == 20) {
        toView.y = -toView.height;
        fromViewFrame2 = CGRectMake(fromView.x, fromView.height, fromView.width, fromView.height);
    }// 下
    else if (self.slideToItem + self.slideDirection == 21) {
        toView.y = toView.height;
        fromViewFrame2 = CGRectMake(fromView.x, -fromView.height, fromView.width, fromView.height);
    }
    CGRect toViewFrame2 = fromView.frame;
    [UIView animateWithDuration:duration animations:^{
        toView.frame   = toViewFrame2;
        fromView.frame = fromViewFrame2;
    }completion:^(BOOL finished) {
        complete();
    }];
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.complete();
}


@end
