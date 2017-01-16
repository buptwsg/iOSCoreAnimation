//
//  TransitionDemoViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/1/16.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "TransitionDemoViewController.h"

@interface TransitionDemoViewController ()
@property (strong, nonatomic) IBOutlet UIView *primaryView;
@property (strong, nonatomic) IBOutlet UIView *secondaryView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation TransitionDemoViewController
{
    BOOL displayingPrimary;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    displayingPrimary = NO;
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
- (IBAction)demoTransitionFrom:(id)sender {
    [UIView transitionFromView:(displayingPrimary ? self.primaryView : self.secondaryView)
                        toView:(displayingPrimary ? self.secondaryView : self.primaryView)
                      duration:1.0
                       options:(displayingPrimary ? UIViewAnimationOptionTransitionFlipFromTop :
                                UIViewAnimationOptionTransitionFlipFromBottom)
                    completion:^(BOOL finished) {
                        if (finished) {
                            displayingPrimary = !displayingPrimary;
                        }
                    }];
}

- (IBAction)demoTransitionWith:(id)sender {
    [UIView transitionWithView:self.containerView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCurlUp
                    animations:^{
                        self.primaryView.hidden = NO;
                        self.secondaryView.hidden = YES;
                    }
                    completion:^(BOOL finished){
                        UIView*    temp = self.primaryView;
                        self.primaryView = self.secondaryView;
                        self.secondaryView = temp;
                    }];
}

@end
