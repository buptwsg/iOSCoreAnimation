//
//  ImplicitAnimationViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/1/17.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "ImplicitAnimationViewController.h"

@interface ImplicitAnimationViewController ()
@property (weak, nonatomic) IBOutlet UIView *targetView;

@end

@implementation ImplicitAnimationViewController
{
    CALayer *_subLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _subLayer = [[CALayer alloc] init];
    _subLayer.bounds = CGRectMake(0, 0, self.targetView.bounds.size.width - 10, self.targetView.bounds.size.height - 10);
    _subLayer.position = CGPointMake(self.targetView.bounds.size.width/2, self.targetView.bounds.size.height/2);
    _subLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [self.targetView.layer addSublayer: _subLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeBgColor:(id)sender {
    if (CGColorEqualToColor(_subLayer.backgroundColor, [UIColor cyanColor].CGColor)) {
        _subLayer.backgroundColor = [UIColor yellowColor].CGColor;
    }
    else {
        _subLayer.backgroundColor = [UIColor cyanColor].CGColor;
    }
}

- (IBAction)changeOpacity:(id)sender {
    CGFloat startOpacity = 0;
    CGFloat targetOpacity = 0;
    if (_subLayer.opacity < 0.4) {
        startOpacity = 0.3;
        targetOpacity = 1.0;
    }
    else {
        startOpacity = 1.0;
        targetOpacity = 0.3;
    }
    
    _subLayer.opacity = targetOpacity;
}

- (IBAction)changePosition:(id)sender {
    if (_subLayer.position.x > self.targetView.bounds.size.width / 2) {
        _subLayer.position = CGPointMake(self.targetView.bounds.size.width/2, self.targetView.bounds.size.height/2);
    }
    else {
        _subLayer.position = CGPointMake(self.targetView.bounds.size.width/2+10, self.targetView.bounds.size.height/2+10);
    }
}

- (IBAction)changeSize:(id)sender {
    if (_subLayer.bounds.size.width < self.targetView.bounds.size.width - 10) {
        _subLayer.bounds = CGRectMake(0, 0, self.targetView.bounds.size.width - 10, self.targetView.bounds.size.height - 10);
    }
    else {
        _subLayer.bounds = CGRectMake(0, 0, self.targetView.bounds.size.width - 30, self.targetView.bounds.size.height - 30);
    }
}

- (IBAction)changeAnchorPoint:(id)sender {
    if (CGPointEqualToPoint(_subLayer.anchorPoint, CGPointMake(.5, .5))) {
        _subLayer.anchorPoint = CGPointMake(1, .5);
    }
    else {
        _subLayer.anchorPoint = CGPointMake(.5, .5);
    }
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
