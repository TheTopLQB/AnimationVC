//
//  LQBAnimationViewController.m
//  AnimationVC
//
//  Created by 李庆彬 on 3/22/16.
//  Copyright © 2016 LQB. All rights reserved.
//

#import "LQBAnimationViewController.h"

@implementation LQBAnimationViewController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView * continerView = [transitionContext containerView];
    
    UIView * fromView = fromVC.view;
    UIView * toView = toVC.view;
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if ([toVC isBeingPresented]) {
        [continerView addSubview:toView];
        CGFloat toViewWidth = continerView.frame.size.width * 2.0 / 3.0;
        CGFloat toViewHeight = continerView.frame.size.height * 2.0 / 3.0;
        toView.center = continerView.center;
        toView.bounds = CGRectMake(0, 0, 1, toViewHeight);
        
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            toView.bounds = CGRectMake(0, 0, toViewWidth, toViewHeight);
        } completion:^(BOOL finished) {
            BOOL isCancelled = [transitionContext transitionWasCancelled];
            [transitionContext completeTransition:!isCancelled];
        }];
    }
    
    if ([fromVC isBeingDismissed]) {
        CGFloat fromViewHeight = fromView.frame.size.height;
        [UIView animateWithDuration:duration animations:^{
            fromView.bounds = CGRectMake(0, 0, 1, fromViewHeight);
        } completion:^(BOOL finished) {
            BOOL isCancelled = [transitionContext transitionWasCancelled];
            [transitionContext completeTransition:!isCancelled];
        }];
    }
}


@end
