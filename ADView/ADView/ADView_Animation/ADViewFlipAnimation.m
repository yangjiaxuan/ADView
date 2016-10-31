//
//  ADViewFlowAnimation.m
//  ADView
//
//  Created by yangsen on 16/10/31.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import "ADViewFlipAnimation.h"

@implementation ADViewFlipAnimation

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView duration:(CGFloat)duration completion:(dispatch_block_t)complete{

    [super animationFromView:fromView toView:toView duration:duration transitionSetting:^(CATransition *transition) {
        transition.type = @"oglFlip";
    } completion:^{
        
    }];
}
@end
