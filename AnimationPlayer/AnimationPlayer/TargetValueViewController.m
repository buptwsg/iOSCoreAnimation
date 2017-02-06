//
//  TargetValueViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/6.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "TargetValueViewController.h"

void testRestoreToOriginal(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 300, 300);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"bounds.size"];
    basicAnimation.toValue = @[@400, @500];
    basicAnimation.duration = 1;
    [testLayer addAnimation: basicAnimation forKey: @"test"];
}

void testKeepByFillMode(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 300, 300);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"bounds.size"];
    basicAnimation.toValue = @[@370, @450];
    basicAnimation.duration = 1;
    basicAnimation.removedOnCompletion = NO;
    basicAnimation.fillMode = kCAFillModeForwards;
    [testLayer addAnimation: basicAnimation forKey: @"test"];
}

static TestCase cases[] = {
    {"Restore to original after animation ends", testRestoreToOriginal},
    {"Keep to final value", testKeepByFillMode},
};

@interface TargetValueViewController ()

@end

@implementation TargetValueViewController

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
