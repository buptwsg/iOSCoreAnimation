//
//  PauseResumeViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/7.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "PauseResumeViewController.h"

void testPauseAndResume(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, 150);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"event_pop_box"].CGImage);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"position.y"];
    basicAnimation.fromValue = @150;
    basicAnimation.toValue = @550;
    basicAnimation.duration = 5;
    [testLayer addAnimation: basicAnimation forKey: @"position"];
    
    //第2秒的时候暂停，5秒钟后继续
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CFTimeInterval pausedTime = [testLayer convertTime:CACurrentMediaTime() fromLayer:nil];
        testLayer.speed = 0.0;
        testLayer.timeOffset = pausedTime;
        NSLog(@"pausedTime is %f", pausedTime);
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CFTimeInterval pausedTime = [testLayer timeOffset];
        testLayer.speed = 1.0;
        testLayer.timeOffset = 0.0;
        testLayer.beginTime = 0.0;
        CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
        testLayer.beginTime = timeSincePause;
        NSLog(@"timeSincePause is %f", timeSincePause);
    });
}

static TestCase cases[] = {
    {"Pause and Resume", testPauseAndResume}
};

@interface PauseResumeViewController ()

@end

@implementation PauseResumeViewController

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
