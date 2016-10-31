//
//  ADViewTransitionAnimation.h
//  ADView
//
//  Created by yangsen on 16/10/31.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import "ADViewBaseAnimation.h"

typedef void(^TransitionSettingAction)(CATransition *transition);

@interface ADViewTransitionAnimation : ADViewBaseAnimation<CAAnimationDelegate>

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView duration:(CGFloat)duration transitionSetting:(TransitionSettingAction)transitionSetting completion:(dispatch_block_t)complete;

@end
