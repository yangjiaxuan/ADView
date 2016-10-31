//
//  ViewController.m
//  ADView
//
//  Created by yangsen on 16/9/30.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import "ViewController.h"
#import "ADView.h"

@interface ViewController ()<ADViewDelegate>
{
    ADView  *adView;
    NSArray *imageArr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    imageArr = @[@"1", @"2", @"3", @"4", @"5"];
    adView = [[ADView alloc]initWithFrame:(CGRect){{10,110},{300,400}} slideDirection:ADViewSlideDirectionVertical];
    adView.animationType = ADViewAnimationTypeCube;
    adView.animationDuration = 0.5;
    adView.spaceDuration     = 2.5;
    adView.delegate          = self;
    [self.view addSubview:adView];
}

- (NSInteger)numberOfItemInADView:(ADView *)adView{

    return imageArr.count;
}

- (UIView *)ADView:(ADView *)adView cellForItemAtIndex:(NSInteger)index{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:(CGRect){{10,210},{300,80}}];
    imageView.image = [UIImage imageNamed:imageArr[index]];
    return imageView;
}


@end
