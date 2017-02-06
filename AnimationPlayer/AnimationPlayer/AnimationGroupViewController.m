//
//  AnimationGroupViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/6.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "AnimationGroupViewController.h"

void testRotateAndMove(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspect;
    testLayer.contents = (id)[UIImage imageNamed: @"achievement_pop_hot"].CGImage;
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath: @"transform.rotation.z"];
    rotate.fromValue = @0;
    rotate.toValue = @(M_PI * 2.0);
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath: @"position"];
    move.fromValue = [NSValue valueWithCGPoint: testLayer.position];
    move.toValue = [NSValue valueWithCGPoint: CGPointMake(100, 100)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotate, move];
    group.autoreverses = YES;
    group.repeatCount = 50;
    group.duration = 3;
    [testLayer addAnimation: group forKey: @"RotateAndMove"];
}

void testRotateShortDuration(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspect;
    testLayer.contents = (id)[UIImage imageNamed: @"achievement_pop_hot"].CGImage;
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath: @"transform.rotation.z"];
    rotate.fromValue = @0;
    rotate.toValue = @(M_PI * 2.0);
    rotate.duration = 1.5;
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath: @"position"];
    move.fromValue = [NSValue valueWithCGPoint: testLayer.position];
    move.toValue = [NSValue valueWithCGPoint: CGPointMake(100, 100)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotate, move];
    group.autoreverses = YES;
    group.repeatCount = 50;
    group.duration = 3;
    [testLayer addAnimation: group forKey: @"RotateAndMove"];
}

void testRotateClipped(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspect;
    testLayer.contents = (id)[UIImage imageNamed: @"achievement_pop_hot"].CGImage;
    
    CABasicAnimation *rotate = [CABasicAnimation animationWithKeyPath: @"transform.rotation.z"];
    rotate.fromValue = @0;
    rotate.toValue = @(M_PI * 2.0);
    rotate.duration = 6;
    
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath: @"position"];
    move.fromValue = [NSValue valueWithCGPoint: testLayer.position];
    move.toValue = [NSValue valueWithCGPoint: CGPointMake(100, 100)];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotate, move];
    group.autoreverses = YES;
    group.repeatCount = 50;
    group.duration = 3;
    [testLayer addAnimation: group forKey: @"RotateAndMove"];
}

static TestCase cases[] = {
    {"Rotate and Move", testRotateAndMove},
    {"Rotate and Move: rotate duration shorter", testRotateShortDuration},
    {"Rotate and Move: rotate is clipped", testRotateClipped}
};

@interface AnimationGroupViewController ()

@end

@implementation AnimationGroupViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.casesArray = cases;
        self.numberOfCases = sizeof(cases) / sizeof(TestCase);
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
