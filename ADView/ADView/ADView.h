//
//  ADView.h
//  ADView
//
//  Created by yangsen on 16/9/30.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADViewFlipAnimation.h"

typedef NS_ENUM(NSInteger, ADViewAnimationType){

    ADViewAnimationTypeFlip,
    ADViewAnimationTypeCube,
    ADViewAnimationTypeLiner,
    ADViewAnimationTypeSuckEffect,
    ADViewAnimationTypeRippleEffect,
    ADViewAnimationTypeFade,
    ADViewAnimationTypePush,
    ADViewAnimationTypeReveal,
    ADViewAnimationTypeMoveIn,
};

@protocol ADViewDelegate;
@interface ADView : UIView

@property (assign, nonatomic) id <ADViewDelegate> delegate;
@property (assign, nonatomic) ADViewSlideDirection  slideDirection;
@property (assign, nonatomic) ADViewAnimationType   animationType;
@property (assign, nonatomic) CGFloat               animationDuration;
@property (assign, nonatomic) CGFloat               spaceDuration;
@property (assign, nonatomic, getter=isShowAnimation) BOOL showAnimation;
- (instancetype)initWithFrame:(CGRect)frame slideDirection:(ADViewSlideDirection)slideDirection;

@end

@protocol ADViewDelegate <NSObject>

@required
- (UIView *)ADView:(ADView *)adView cellForItemAtIndex:(NSInteger)index;
- (NSInteger)numberOfItemInADView:(ADView *)adView;

@optional
- (void)ADView:(ADView *)adView didSelectItemAtIndex:(NSInteger)index;

@end
