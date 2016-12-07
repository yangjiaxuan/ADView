//
//  ADViewCureAnimation.m
//  ADView
//
//  Created by yangsen on 16/10/31.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import "ADViewCubeAnimation.h"

@interface ADViewCubeAnimation()

@end
@implementation ADViewCubeAnimation

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView duration:(CGFloat)duration completion:(dispatch_block_t)complete{
    [super animationFromView:fromView toView:toView duration:duration transitionSetting:^(CATransition *transition) {
        transition.type = @"cube";
    } completion:complete];
}

@end
