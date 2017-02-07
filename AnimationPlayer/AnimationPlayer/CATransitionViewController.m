//
//  CATransitionViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/7.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "CATransitionViewController.h"

void testTransitionFade(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_box"].CGImage);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_sun"].CGImage);
        CATransition * ani = [CATransition animation];
        ani.type = kCATransitionFade;
        ani.duration = 2;
        ani.autoreverses = YES;
        ani.repeatCount = 50;
        [testLayer addAnimation:ani forKey:@"transitionAni"];
    });
}

void testTransitionMoveIn(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_box"].CGImage);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_sun"].CGImage);
        CATransition * ani = [CATransition animation];
        ani.type = kCATransitionMoveIn;
        ani.subtype = kCATransitionFromLeft;
        ani.duration = 2;
        ani.autoreverses = YES;
        ani.repeatCount = 50;
        [testLayer addAnimation:ani forKey:@"transitionAni"];
    });
}

void testTransitionPush(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_box"].CGImage);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_sun"].CGImage);
        CATransition * ani = [CATransition animation];
        ani.type = kCATransitionPush;
        ani.subtype = kCATransitionFromRight;
        ani.duration = 2;
        ani.autoreverses = YES;
        ani.repeatCount = 50;
        [testLayer addAnimation:ani forKey:@"transitionAni"];
    });
}

void testTransitionReveal(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_box"].CGImage);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_sun"].CGImage);
        CATransition * ani = [CATransition animation];
        ani.type = kCATransitionReveal;
        ani.subtype = kCATransitionFromTop;
        ani.duration = 2;
        ani.autoreverses = YES;
        ani.repeatCount = 50;
        [testLayer addAnimation:ani forKey:@"transitionAni"];
    });
}

static TestCase cases[] = {
    {"Transition Fade", testTransitionFade},
    {"Transition MoveIn", testTransitionMoveIn},
    {"Transition Push", testTransitionPush},
    {"Transition Reveal", testTransitionReveal}
};

@interface CATransitionViewController ()

@end

@implementation CATransitionViewController

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
