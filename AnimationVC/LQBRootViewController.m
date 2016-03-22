//
//  LQBRootViewController.m
//  AnimationVC
//
//  Created by 李庆彬 on 3/22/16.
//  Copyright © 2016 LQB. All rights reserved.
//

#import "LQBRootViewController.h"
#import "LQBAnimationViewController.h"
#import "LQBPresentedViewController.h"

@interface LQBRootViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation LQBRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)present:(UIButton *)sender {
    LQBPresentedViewController * presentVC = [[LQBPresentedViewController alloc] init];
    presentVC.transitioningDelegate = self;
    presentVC.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController presentViewController:presentVC animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    LQBAnimationViewController * anmation = [[LQBAnimationViewController alloc] init];
    return anmation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    LQBAnimationViewController * anmation = [[LQBAnimationViewController alloc] init];
    return anmation;
}

@end
