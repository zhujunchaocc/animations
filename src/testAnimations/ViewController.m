//
//  ViewController.m
//  testAnimations
//
//  Created by zhujunchao on 14-6-20.
//  Copyright (c) 2014年 zhujunchao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize showBtn;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    animationsView = [[AnimationsView alloc] init];
    status = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (IBAction)onClkBtn:(id)sender {
    NSLog(@"enter in onClkBtn");
    [animationsView ShowAddCouponView:status];
    if (status == YES) {
        [showBtn setTitle:@"关闭" forState:UIControlStateNormal];
    }else{
        [showBtn setTitle:@"显示" forState:UIControlStateNormal];
    }
    status = !status;
    
}
@end
