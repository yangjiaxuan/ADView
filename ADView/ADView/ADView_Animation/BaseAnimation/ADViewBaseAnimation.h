//
//  ADViewBaseAnimation.h
//  ADView
//
//  Created by yangsen on 16/10/31.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+Frame.h"

typedef NS_ENUM(NSInteger, SlideToItem){
    
    SlideToItemLast, // 上一个
    SlideToItemNext  // 下一个
};


typedef NS_ENUM(NSInteger, ADViewSlideDirection){
    
    ADViewSlideDirectionHorizontal = 10,    // 横向
    ADViewSlideDirectionVertical   = 20      // 纵向
};


@interface ADViewBaseAnimation : NSObject

@property (assign, nonatomic) SlideToItem           slideToItem;
@property (assign, nonatomic) ADViewSlideDirection  slideDirection;

- (void)animationFromView:(UIView *)fromView toView:(UIView *)toView duration:(CGFloat)duration completion:(dispatch_block_t)complete;

@end
