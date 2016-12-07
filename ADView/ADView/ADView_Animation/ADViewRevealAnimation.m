//
//  ADViewRevealAnimation.m
//  ADView
//
//  Created by yangsen on 16/12/7.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import "ADViewRevealAnimation.h"

@implementation ADViewRevealAnimation

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView duration:(CGFloat)duration completion:(dispatch_block_t)complete{
    
    [super animationFromView:fromView toView:toView duration:duration transitionSetting:^(CATransition *transition) {
        transition.type = kCATransitionReveal;
    } completion:complete];
    
}
@end
