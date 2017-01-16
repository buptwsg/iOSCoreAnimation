//
//  UIViewAnimationViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/1/13.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "UIViewAnimationViewController.h"

@interface UIViewAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *frameView;
@property (weak, nonatomic) IBOutlet UIView *boundsView;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UIView *scaleView;
@property (weak, nonatomic) IBOutlet UIView *rotateView;
@property (weak, nonatomic) IBOutlet UIView *translateView;
@property (weak, nonatomic) IBOutlet UIView *alphaView;
@property (weak, nonatomic) IBOutlet UIView *bgColorView;

@end

@implementation UIViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    
    CGRect frame = self.frameView.frame;
    [UIView animateWithDuration: 1 delay: 0 options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        self.frameView.frame = CGRectMake(frame.origin.x + 20, frame.origin.y + 20, frame.size.width - 40, frame.size.height - 40);
    } completion:^(BOOL finished) {
        NSLog(@"frame animation completed");
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.frameView.layer removeAllAnimations];
        self.frameView.frame = frame;
    });
    
    CGRect bounds = self.boundsView.bounds;
    [UIView animateWithDuration: 1 delay: 0 options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        [UIView setAnimationRepeatCount: 3];
        self.boundsView.bounds = CGRectMake(-20, -20, bounds.size.width - 40, bounds.size.height - 40);
    } completion: nil];
    
    CGPoint center = self.centerView.center;
    [UIView animateWithDuration: 1 delay: 0 options: UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse animations:^{
        self.centerView.center = CGPointMake(center.x + 20, center.y - 20);
    } completion: nil];
    
    [UIView animateWithDuration: 1 delay: 0 options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        self.scaleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2, 0.5);
    } completion: nil];
    
    [UIView animateWithDuration: 1 delay: 0 options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        self.rotateView.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 90);
    } completion: nil];
    
    [UIView animateWithDuration: 1 delay: 0 options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        self.translateView.transform = CGAffineTransformTranslate(CGAffineTransformIdentity, 20, 20);
    } completion: nil];
    
    [UIView animateWithDuration: 1 delay: 0 options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        self.alphaView.alpha = 0.3;
    } completion: nil];
    
    [UIView animateWithDuration: 1 delay: 0 options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
        self.bgColorView.backgroundColor = [UIColor blueColor];
    } completion: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
