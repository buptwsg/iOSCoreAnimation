//
//  CATransactionViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/7.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "CATransactionViewController.h"

void testChangeDuration(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, 150);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_box"].CGImage);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration: 5];
        [testLayer setValue: @550 forKeyPath: @"position.y"];
        [CATransaction commit];
    });
}

void testDisableImplicitAnimation(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, 150);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_box"].CGImage);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration: 5];
        [CATransaction setDisableActions: YES]; //其它代码都与上个例子一样，但加上这一行后，就没有隐式的动画了。
        [testLayer setValue: @550 forKeyPath: @"position.y"];
        [CATransaction commit];
    });
}

void tesNestedTransactions(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, 150);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_box"].CGImage);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [CATransaction begin];
        [CATransaction setAnimationDuration: 2];
        [testLayer setValue: @550 forKeyPath: @"position.y"];
        
        [CATransaction begin];
        [CATransaction setAnimationDuration: 5];
        testLayer.opacity=0.0;
        [CATransaction commit];
        
        [CATransaction commit];
    });
}

void testCompletionBlock(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, 150);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_box"].CGImage);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [CATransaction setCompletionBlock:^{
            CATextLayer *textLayer = [CATextLayer layer];
            textLayer.string = @"Animation Finished";
            textLayer.foregroundColor = [UIColor cyanColor].CGColor;
            textLayer.alignmentMode = kCAAlignmentCenter;
            textLayer.position = CGPointMake(layer.bounds.size.width/2, 150);
            textLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width, 100);
            [layer addSublayer: textLayer];
        }];
        
        [CATransaction begin];
        [CATransaction setAnimationDuration: 2];
        [testLayer setValue: @550 forKeyPath: @"position.y"];
        [CATransaction commit];
    });
}

static TestCase cases[] = {
    {"Change Duration", testChangeDuration},
    {"Disable implicit animation", testDisableImplicitAnimation},
    {"Nested Transaction", tesNestedTransactions},
    {"Set Completion Block", testCompletionBlock}
};

@interface CATransactionViewController ()

@end

@implementation CATransactionViewController

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
