//
//  ADView.m
//  ADView
//
//  Created by yangsen on 16/9/30.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import "ADView.h"
#import "ADViewFlipAnimation.h"
#import "ADViewCubeAnimation.h"
#import "ADViewLinerAnimation.h"

@interface ADView()
{
    NSTimer   *_timer;
    UIView    *_currentView;
    NSInteger  _numberOfItems;
    NSInteger  _currentItemIndex;
    
    ADViewBaseAnimation * _animation;
    SlideToItem           _slideToItem;
}
@end

@implementation ADView

- (instancetype)initWithFrame:(CGRect)frame slideDirection:(ADViewSlideDirection)slideDirection{
    if (self = [super initWithFrame:frame]) {
        self.slideDirection = slideDirection;
        self.frame = frame;
        [self setupData];
        [self addPanGesture];
        [self addTimer];
    }
    return self;
}

- (void)setupData{
    self.clipsToBounds = YES;
    _numberOfItems     = 0;
    _currentItemIndex  = 0;
    _animationDuration = 0.5;
    _spaceDuration     = 1.5;
    _showAnimation     = YES;
}

- (void)setUI{
    if ([self.delegate respondsToSelector:@selector(numberOfItemInADView:)]) {
        _numberOfItems = [self .delegate numberOfItemInADView:self];
    }
    BOOL isShowAnimation = self.showAnimation;
    CGFloat animationDuration = _animationDuration;
    self.showAnimation = NO;
    [self startToScroll];
    self.showAnimation = isShowAnimation;
    _animationDuration = animationDuration;
}

#pragma ------------ 手势 --------------
- (void)addPanGesture{

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:pan];
}

- (void)panAction:(UIPanGestureRecognizer *)sender{
    if (sender.state == UIGestureRecognizerStateBegan) {
        [self invalidateTimer];
        [sender setTranslation:CGPointZero inView:sender.view];
    }
    else if (sender.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [sender velocityInView:sender.view];
        if (((self.slideDirection == ADViewSlideDirectionHorizontal) && (velocity.x < 0))||((self.slideDirection == ADViewSlideDirectionVertical) && (velocity.y < 0))) {
    
            [self UIGoWithDirection:SlideToItemNext];
        }
        else if (((self.slideDirection == ADViewSlideDirectionHorizontal) && (velocity.x > 0))||((self.slideDirection == ADViewSlideDirectionVertical) && (velocity.y > 0))) {
        
            [self UIGoWithDirection:SlideToItemLast];
        }
        
        self.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_animationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.userInteractionEnabled = YES;
            [self addTimer];
        });
    }
}

#pragma mark -------------- timer ------------

- (void)addTimer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:_spaceDuration target:self selector:@selector(UIGo) userInfo:nil repeats:YES];
    }
}

- (void)invalidateTimer{
    [_timer invalidate];
    _timer = nil;
}


#pragma mark --------- 逻辑 ---------------

- (void)UIGo{

    [self UIGoWithDirection:SlideToItemNext];
}

- (void)UIGoWithDirection:(SlideToItem)SlideToItem{
    if (SlideToItem == SlideToItemNext) {
        _slideToItem = SlideToItemNext;
        _currentItemIndex ++;
        if (_currentItemIndex >= _numberOfItems) {
            _currentItemIndex = 0;
        }
    }
    else{
        _slideToItem = SlideToItemLast;
        _currentItemIndex --;
        if (_currentItemIndex <= -1) {
            _currentItemIndex = _numberOfItems - 1;
        }
    }
    [self startToScroll];
}
- (void)startToScroll{
    
    if ([self.delegate respondsToSelector:@selector(ADView:cellForItemAtIndex:)]) {
        UIView *subView = [self.delegate ADView:self cellForItemAtIndex:_currentItemIndex];
        subView.frame = self.bounds;
        [self addSubview:subView];
        
        if (self.isShowAnimation) {
            _animation.slideToItem = _slideToItem;
            [_animation animationFromView:_currentView toView:subView duration:self.animationDuration completion:^{
                [_currentView removeFromSuperview];
                _currentView = subView;

            }];
        }
        else{
            [self addSubview:subView];
            [_currentView removeFromSuperview];
            _currentView = subView;
        }
    }
}

#pragma mark -------------- set ------------------

- (void)setSpaceDuration:(CGFloat)spaceDuration{
    _spaceDuration = spaceDuration;
    [self invalidateTimer];
    [self addTimer];
}

- (void)setAnimationDuration:(CGFloat)animationDuration{
    _animationDuration = animationDuration;
    [self invalidateTimer];
    [self addTimer];
}

- (void)setDelegate:(id<ADViewDelegate>)delegate{
    _delegate = delegate;
    [self setUI];
}

- (void)setShowAnimation:(BOOL)showAnimation{
    _showAnimation = showAnimation;
    if (!_showAnimation) {
        _animationDuration = 0;
    }
}

- (void)setAnimationType:(ADViewAnimationType)animationType{
    if (animationType == ADViewAnimationTypeFlip) {
        _animation = [[ADViewFlipAnimation alloc]init];
    }
    else if (animationType == ADViewAnimationTypeCube) {
        _animation = [[ADViewCubeAnimation alloc]init];
    }
    else if (animationType == ADViewAnimationTypeLiner) {
        _animation = [[ADViewLinerAnimation alloc]init];
    }
    _animation.slideDirection = self.slideDirection;
}

@end
