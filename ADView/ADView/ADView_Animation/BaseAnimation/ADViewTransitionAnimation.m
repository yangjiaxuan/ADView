//
//  ADViewTransitionAnimation.m
//  ADView
//
//  Created by yangsen on 16/10/31.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import "ADViewTransitionAnimation.h"

@interface ADViewTransitionAnimation()

@property(copy, nonatomic) dispatch_block_t complete;

@end
@implementation ADViewTransitionAnimation

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView duration:(CGFloat)duration completion:(dispatch_block_t)complete{

}

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView duration:(CGFloat)duration transitionSetting:(TransitionSettingAction)transitionSetting completion:(dispatch_block_t)complete{
    
    _complete = complete;
    CATransition *transitrion = [[CATransition alloc]init];
    transitrion.duration = duration;
    if (self.slideToItem + self.slideDirection == 10) {
        transitrion.subtype = kCATransitionFromLeft;
    }
    else if (self.slideToItem + self.slideDirection == 11) {
        transitrion.subtype = kCATransitionFromRight;
    }
    else if (self.slideToItem + self.slideDirection == 21) {
        transitrion.subtype = kCATransitionFromTop;
    }
    else if (self.slideToItem + self.slideDirection == 20) {
        transitrion.subtype = kCATransitionFromBottom;
    }
    transitrion.type = @"cube";
    transitrion.removedOnCompletion = NO;
    if (transitionSetting) {
        transitionSetting(transitrion);
    }
    [fromView.superview.layer addAnimation:transitrion forKey:transitrion.type];
}
- (void)animationDidStart:(CAAnimation *)anim{}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.complete();
}
@end
