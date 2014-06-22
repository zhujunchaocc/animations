//
//  ViewController.h
//  testAnimations
//
//  Created by zhujunchao on 14-6-20.
//  Copyright (c) 2014年 zhujunchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimationsView.h"

@interface ViewController : UIViewController{
    AnimationsView *animationsView;
    BOOL status;
}
@property (strong, nonatomic) IBOutlet UIButton *showBtn;
- (IBAction)onClkBtn:(id)sender;


@end
