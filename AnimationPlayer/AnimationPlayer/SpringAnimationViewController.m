//
//  SpringAnimationViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/6.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "SpringAnimationViewController.h"

void testSpringRotation(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 200, 200);
    testLayer.contentsGravity = kCAGravityResizeAspect;
    testLayer.contents = (id)[UIImage imageNamed: @"achievement_pop_hot"].CGImage;
    
    CASpringAnimation* springRotation = [CASpringAnimation animationWithKeyPath:@"transform.rotation.z"];
    springRotation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    springRotation.duration = 2.0f;
    springRotation.cumulative = YES;
    springRotation.repeatCount = INT_MAX;
    springRotation.damping = 8;
    [testLayer addAnimation:springRotation forKey:@"rotationAnimation"];
}

void testSpringBounds(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspect;
    testLayer.contents = (id)[UIImage imageNamed: @"achievement_pop_hot"].CGImage;
    
    CASpringAnimation* springRotation = [CASpringAnimation animationWithKeyPath:@"bounds.size"];
    springRotation.fromValue = [NSValue valueWithCGSize: CGSizeMake(100, 100)];
    springRotation.toValue = [NSValue valueWithCGSize: CGSizeMake(300, 300)];
    springRotation.duration = 1.0f;
    springRotation.autoreverses = YES;
    springRotation.repeatCount = INT_MAX;
    [testLayer addAnimation:springRotation forKey:@"rotationAnimation"];
}

void testSpringPosition(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.contentsGravity = kCAGravityResizeAspect;
    testLayer.contents = (id)[UIImage imageNamed: @"achievement_pop_hot"].CGImage;
    
    CASpringAnimation * ani = [CASpringAnimation animationWithKeyPath:@"position"];
    ani.mass = 10.0; //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
    ani.stiffness = 5000; //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    ani.damping = 100.0;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    ani.initialVelocity = 5.f;//初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    ani.duration = 2;
    ani.toValue = [NSValue valueWithCGPoint: CGPointMake(layer.bounds.size.width/4, layer.bounds.size.height * 3 / 4)];
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    ani.autoreverses = YES;
    ani.repeatCount = 50;
    [testLayer addAnimation:ani forKey:@"boundsAni"];
}

static TestCase cases[] = {
    {"Spring rotation", testSpringRotation},
    {"Spring bounds", testSpringBounds},
    {"Spring position", testSpringPosition}
};


@interface SpringAnimationViewController ()

@end

@implementation SpringAnimationViewController

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
