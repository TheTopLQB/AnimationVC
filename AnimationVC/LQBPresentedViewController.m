//
//  LQBPresentedViewController.m
//  AnimationVC
//
//  Created by 李庆彬 on 3/22/16.
//  Copyright © 2016 LQB. All rights reserved.
//

#import "LQBPresentedViewController.h"

@interface LQBPresentedViewController ()
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@end

@implementation LQBPresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 }

- (IBAction)dismiss:(UIButton *)sender {
    CGAffineTransform transform = CGAffineTransformMakeRotation(3 * M_PI);
    transform = CGAffineTransformScale(transform, 0.1, 0.1);
    
    [UIView animateWithDuration:0.4 animations:^{
        self.dismissButton.transform = transform;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end
