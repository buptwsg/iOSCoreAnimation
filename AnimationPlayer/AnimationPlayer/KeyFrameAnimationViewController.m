//
//  KeyFrameAnimationViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/4.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "KeyFrameAnimationViewController.h"

void testCGPointWithArray(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(100, 200);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"position"];
    NSValue *value1 = [NSValue valueWithCGPoint: CGPointMake(100, 200)];
    NSValue *value2 = [NSValue valueWithCGPoint: CGPointMake(300, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint: CGPointMake(300, 400)];
    NSValue *value4 = [NSValue valueWithCGPoint: CGPointMake(100, 400)];
    animation.values = @[value1, value2, value3, value4, value1];
    animation.repeatCount = 3;
    animation.duration = 2;
    [testLayer addAnimation: animation forKey: @"position"];
}

void testCGPointWithPath(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(100, 200);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    testLayer.cornerRadius = 100 / 2;
    
    CGMutablePathRef thePath = CGPathCreateMutable();
    CGPathMoveToPoint(thePath, NULL, 100, 200);
    CGPathAddCurveToPoint(thePath, NULL, 100, 500, 200, 500, 200, 200);
    CGPathAddCurveToPoint(thePath, NULL, 200, 500, 300, 500, 300, 200);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"position"];
    animation.path = thePath;
    animation.duration = 4;
    animation.autoreverses = YES;
    animation.repeatCount = 50;
    [testLayer addAnimation: animation forKey: @"position"];
}

void testCGRect(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"bounds"];
    NSValue *value1 = [NSValue valueWithCGRect: CGRectMake(0, 0, 100, 100)];
    NSValue *value2 = [NSValue valueWithCGRect: CGRectMake(50, 50, 200, 200)];
    NSValue *value3 = [NSValue valueWithCGRect: CGRectMake(0, 0, 300, 300)];
    NSValue *value4 = [NSValue valueWithCGRect: CGRectMake(50, 50, 400, 400)];
    animation.values = @[value1, value2, value3, value4];
    animation.autoreverses = YES;
    animation.repeatCount = 50;
    animation.duration = 3;
    [testLayer addAnimation: animation forKey: @"position"];
}

void testTransformWithKeyframe(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    
    NSValue *value1 = [NSValue valueWithCATransform3D: CATransform3DIdentity];
    NSValue *value2 = [NSValue valueWithCATransform3D: CATransform3DRotate(CATransform3DIdentity, M_PI, 0, 0, 1)];
    NSValue *value3 = [NSValue valueWithCATransform3D: CATransform3DScale(CATransform3DIdentity, 3, 3, 0)];
    NSValue *value4 = [NSValue valueWithCATransform3D: CATransform3DTranslate(CATransform3DIdentity, 100, 100, 0)];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"transform"];
    animation.values = @[value1, value2, value3, value4];
    animation.autoreverses = YES;
    animation.repeatCount = 50;
    animation.duration = 4;
    [testLayer addAnimation: animation forKey: @"transform"];
}

void testNumber(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 300, 300);
    testLayer.borderWidth = 20;
    testLayer.borderColor = [UIColor yellowColor].CGColor;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"borderWidth"];
    animation.values = @[@20, @40, @60, @80, @100];
    animation.duration = 5;
    animation.autoreverses = YES;
    animation.repeatCount = 50;
    animation.calculationMode = kCAAnimationDiscrete;
    [testLayer addAnimation: animation forKey: @"border"];
}

void testColor(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 300, 300);
    testLayer.borderWidth = 20;
    testLayer.borderColor = [UIColor yellowColor].CGColor;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"borderColor"];
    animation.values = @[(id)[UIColor yellowColor].CGColor, (id)[UIColor redColor].CGColor, (id)[UIColor purpleColor].CGColor, (id)[UIColor blueColor].CGColor];
    animation.duration = 3;
    animation.autoreverses = YES;
    animation.repeatCount = 50;
    [testLayer addAnimation: animation forKey: @"color"];
}

void testContentsWithKeyframe(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, 300, 300);
    testLayer.contents = (id)([UIImage imageNamed: @"arrow"].CGImage);
    testLayer.contentsGravity = kCAGravityResizeAspectFill;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animation.duration = 4;
    animation.repeatCount = 50;
    animation.values = @[(id)[UIImage imageNamed: @"arrow"].CGImage, (id)[UIImage imageNamed: @"star"].CGImage, (id)[UIImage imageNamed: @"expression"].CGImage, (id)[UIImage imageNamed: @"achievement_pop_hot"].CGImage];
    [testLayer addAnimation: animation forKey: @"contents"];
}

void testLinearAndCubic(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(100, 200);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"position"];
    NSValue *value1 = [NSValue valueWithCGPoint: CGPointMake(100, 200)];
    NSValue *value2 = [NSValue valueWithCGPoint: CGPointMake(300, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint: CGPointMake(300, 400)];
    NSValue *value4 = [NSValue valueWithCGPoint: CGPointMake(100, 400)];
    animation.values = @[value1, value2, value3, value4, value1];
    animation.repeatCount = 10;
    animation.duration = 2;
    animation.keyTimes = @[@0, @0.1, @0.4, @0.8, @1];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn], [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut]];
    
    [testLayer addAnimation: animation forKey: @"position"];
}

void testPaced(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(100, 200);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"position"];
    NSValue *value1 = [NSValue valueWithCGPoint: CGPointMake(100, 200)];
    NSValue *value2 = [NSValue valueWithCGPoint: CGPointMake(300, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint: CGPointMake(300, 400)];
    NSValue *value4 = [NSValue valueWithCGPoint: CGPointMake(100, 400)];
    animation.values = @[value1, value2, value3, value4, value1];
    animation.repeatCount = 10;
    animation.duration = 2;
    animation.calculationMode = kCAAnimationPaced; //设为这个值会忽略keyTimes and timingFunctions
    animation.keyTimes = @[@0, @0.1, @0.4, @0.8, @1];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn], [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut]];
    
    [testLayer addAnimation: animation forKey: @"position"];
}

void testDiscrete(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(100, 200);
    testLayer.bounds = CGRectMake(0, 0, 100, 100);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath: @"position"];
    NSValue *value1 = [NSValue valueWithCGPoint: CGPointMake(100, 200)];
    NSValue *value2 = [NSValue valueWithCGPoint: CGPointMake(300, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint: CGPointMake(300, 400)];
    NSValue *value4 = [NSValue valueWithCGPoint: CGPointMake(100, 400)];
    animation.values = @[value1, value2, value3, value4, value1];
    animation.repeatCount = 10;
    animation.duration = 2;
    animation.keyTimes = @[@0, @0.1, @0.4, @0.8, @1];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn], [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut], [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut]];
    animation.calculationMode = kCAAnimationDiscrete; //设为这个值会忽略timingFunctions
    [testLayer addAnimation: animation forKey: @"position"];
}

static TestCase cases[] = {
    {"animate CGPoint properties with array", testCGPointWithArray},
    {"animate CGPoint properties with path", testCGPointWithPath},
    {"animate CGRect properties", testCGRect},
    {"animate transform properties", testTransformWithKeyframe},
    {"animate number properties", testNumber},
    {"animate color properties", testColor},
    {"animate contents", testContentsWithKeyframe},
    {"Calculation Mode: Linear and Cubic", testLinearAndCubic},
    {"Calculation Mode: Paced", testPaced},
    {"Calculation Mode: Discrete", testDiscrete}
};

@interface KeyFrameAnimationViewController ()

@end

@implementation KeyFrameAnimationViewController

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
