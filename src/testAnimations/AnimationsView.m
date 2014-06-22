//
//  AnimationsView.m
//  testAnimations
//
//  Created by zhujunchao on 14-6-20.
//  Copyright (c) 2014年 zhujunchao. All rights reserved.
//

#import "AnimationsView.h"

@implementation AnimationsView

- (id)initWithFrame:(CGRect)frame
{
    int image_x = 13;
    int image_y = 100;
    int image_height = 246/2;
    int image_widht =  588/2;
    self = [super initWithFrame:CGRectMake(image_x, image_y, image_widht, image_height)];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init
{
    self = [super init];
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    return self;
}

-(void)ShowAddCouponView:(BOOL)status{
    if (status) {
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.transform =CGAffineTransformScale([self transformForOrientation], 0.001, 0.001);
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:kTransitionDuration/1.5];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(bounce1AnimationStopped)];
        self.transform = CGAffineTransformScale([self transformForOrientation], 1.1, 1.1);
        [UIView commitAnimations];
    }else{
        [self removeFromSuperview];
    }
}

#pragma mark animations
static CGFloat kTransitionDuration = 0.3f;
- (CGAffineTransform)transformForOrientation {
	UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
	if (orientation == UIInterfaceOrientationLandscapeLeft) {
		return CGAffineTransformMakeRotation(M_PI*1.5);
	} else if (orientation == UIInterfaceOrientationLandscapeRight) {
		return CGAffineTransformMakeRotation(M_PI/2);
	} else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
		return CGAffineTransformMakeRotation(-M_PI);
	} else {
		return CGAffineTransformIdentity;
	}
}


- (void)bounce2AnimationStopped{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kTransitionDuration/2];
    self.transform = [self transformForOrientation];
	[UIView commitAnimations];
}


- (void)bounce1AnimationStopped{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:kTransitionDuration/2];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:@selector(bounce2AnimationStopped)];
    self.transform = CGAffineTransformScale([self transformForOrientation], 0.9, 0.9);
	[UIView commitAnimations];
}

@end
