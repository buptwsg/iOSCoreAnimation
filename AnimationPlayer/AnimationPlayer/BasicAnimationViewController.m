//
//  BasicAnimationViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/1/20.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "BasicAnimationViewController.h"

void testAnchorPoint(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"anchorPoint"];
    basicAnimation.fromValue = @[@(0.5), @(0.5)];
    basicAnimation.toValue = @[@(0), @(0)];
    basicAnimation.duration = 1.5;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"anchorPoint"];
}

void testBackgroundColor(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"backgroundColor"];
    basicAnimation.fromValue = (__bridge id _Nullable)([UIColor cyanColor].CGColor);
    basicAnimation.toValue = (__bridge id _Nullable)([UIColor orangeColor].CGColor);
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatDuration = 20;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"backgroundColor"];
}

void testBorderColor(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.borderWidth = 15;
    testLayer.borderColor = [UIColor purpleColor].CGColor;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"borderColor"];
    basicAnimation.fromValue = (__bridge id)([UIColor purpleColor].CGColor);
    basicAnimation.toValue = (__bridge id)([UIColor blueColor].CGColor);
    basicAnimation.duration = 1;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"borderColor"];
}

void testBorderWidth(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.borderWidth = 5;
    testLayer.borderColor = [UIColor purpleColor].CGColor;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"borderWidth"];
    basicAnimation.fromValue = @5;
    basicAnimation.toValue = @15;
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"borderWidth"];
}

void testBounds(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"bounds"];
    basicAnimation.toValue = @[@0, @0, @50, @50];
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"bounds"];
}

void testContents(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    UIImage *image = [UIImage imageNamed: @"star"];
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.contents = (__bridge id _Nullable)(image.CGImage);
    testLayer.contentsGravity = kCAGravityResizeAspect;
    
    image = [UIImage imageNamed: @"arrow"];
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"contents"];
    basicAnimation.toValue = (__bridge id _Nullable)(image.CGImage);
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 50;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"contents"];
}

void testContentsRect(CALayer *layer) {
    CALayer *testLayer = [CALayer layer];
    [layer addSublayer: testLayer];
    
    UIImage *image = [UIImage imageNamed: @"star"];
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.contents = (__bridge id _Nullable)(image.CGImage);
    testLayer.contentsRect = CGRectMake(0, 0, 1, 1);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"contentsRect"];
    basicAnimation.toValue = @[@0.3, @0.3, @1, @1];
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 50;
    basicAnimation.removedOnCompletion = YES;
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn];
    [testLayer addAnimation: basicAnimation forKey: @"rect"];
}

void testCornerRadius(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"cornerRadius"];
    basicAnimation.fromValue = @10;
    basicAnimation.toValue = @60;
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = NO;
    [testLayer addAnimation: basicAnimation forKey: @"cornerRadius"];
}

void testHidden(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"hidden"];
    basicAnimation.toValue = @YES;
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"hidden"];
}

void testMask(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.contents = (__bridge id)([UIImage imageNamed: @"arrow"].CGImage);
    
    CALayer *maskLayer1 = [CALayer layer];
    maskLayer1.contents = (__bridge id)([UIImage imageNamed: @"achievement_pop_hot"].CGImage);
    maskLayer1.frame = testLayer.bounds;
    testLayer.mask = maskLayer1;
}

//为什么这个动画不生效呢
void testMasksToBounds(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.masksToBounds = YES;
    
    CALayer *subLayer = [CALayer new];
    [testLayer addSublayer: subLayer];
    subLayer.backgroundColor = [UIColor purpleColor].CGColor;
    subLayer.position = CGPointMake(100, 100);
    subLayer.bounds = CGRectMake(0, 0, 300, 300);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"masksToBounds"];
    basicAnimation.fromValue = @YES;
    basicAnimation.toValue = @NO;
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"masksToBounds"];
}

void testOpacity(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"opacity"];
    basicAnimation.toValue = @0;
    basicAnimation.duration = 1.5;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"opacity"];
}

void testPosition(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"position"];
    basicAnimation.toValue = @[@(layer.bounds.size.width), @(layer.bounds.size.height)];
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"position"];
}

void testShadowColor(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.shadowOpacity = 0.8;
    testLayer.shadowColor = [UIColor purpleColor].CGColor;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"shadowColor"];
    basicAnimation.toValue = (__bridge id)([UIColor brownColor].CGColor);
    basicAnimation.duration = 1;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 5;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"shadow"];
}

void testShadowOffset(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.shadowOpacity = 0.8;
    testLayer.shadowColor = [UIColor purpleColor].CGColor;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"shadowOffset"];
    basicAnimation.toValue = @[@5, @5];
    basicAnimation.duration = 1;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 50;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"shadow"];
}

void testShadowOpacity(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.shadowOpacity = 0;
    testLayer.shadowColor = [UIColor purpleColor].CGColor;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"shadowOpacity"];
    basicAnimation.toValue = @1;
    basicAnimation.duration = 1;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 50;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"shadow"];
}

void testShadowPath(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.shadowOpacity = 0.8;
    testLayer.shadowColor = [UIColor purpleColor].CGColor;
    
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, testLayer.bounds);
    testLayer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, testLayer.bounds);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"shadowPath"];
    basicAnimation.toValue = (__bridge id)circlePath;
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 50;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"shadow"];
    
    CGPathRelease(circlePath);
}

void testShadowRadius(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.shadowOpacity = 0.8;
    testLayer.shadowColor = [UIColor purpleColor].CGColor;
    testLayer.shadowRadius = 3;
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"shadowRadius"];
    basicAnimation.toValue = @20;
    basicAnimation.duration = 1;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 50;
    basicAnimation.removedOnCompletion = YES;
    [testLayer addAnimation: basicAnimation forKey: @"shadow"];
}

void testSublayerTransform(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    CALayer *anotherLayer = [CALayer layer];
    anotherLayer.backgroundColor = [UIColor orangeColor].CGColor;
    anotherLayer.position = CGPointMake(50, 50);
    anotherLayer.bounds = CGRectMake(0, 0, 100, 100);
    [testLayer addSublayer: anotherLayer];
    testLayer.sublayerTransform = CATransform3DIdentity;
    
    CATransform3D transform = CATransform3DConcat(CATransform3DScale(CATransform3DIdentity, 2, 1, 1), CATransform3DRotate(CATransform3DIdentity, M_PI_4, 0, 0, 1));
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"sublayerTransform"];
    basicAnimation.toValue = @[@(transform.m11), @(transform.m12), @(transform.m13), @(transform.m14), @(transform.m21), @(transform.m22), @(transform.m23), @(transform.m24), @(transform.m31), @(transform.m32), @(transform.m33), @(transform.m34), @(transform.m41), @(transform.m42), @(transform.m43), @(transform.m44)];
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 50;
    [testLayer addAnimation: basicAnimation forKey: @"transform"];
}

void testTransform(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.transform = CATransform3DIdentity;
    
    CATransform3D scale = CATransform3DScale(CATransform3DIdentity, 2, 2, 1);
    CATransform3D rotate = CATransform3DRotate(CATransform3DIdentity, M_PI_4, 0, 0, 1);
    CATransform3D translate = CATransform3DTranslate(CATransform3DIdentity, 50, 50, -50);
    CATransform3D transform = CATransform3DConcat(CATransform3DConcat(scale, rotate), translate);
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath: @"transform"];
    basicAnimation.toValue = @[@(transform.m11), @(transform.m12), @(transform.m13), @(transform.m14), @(transform.m21), @(transform.m22), @(transform.m23), @(transform.m24), @(transform.m31), @(transform.m32), @(transform.m33), @(transform.m34), @(transform.m41), @(transform.m42), @(transform.m43), @(transform.m44)];
    basicAnimation.duration = 2;
    basicAnimation.autoreverses = YES;
    basicAnimation.repeatCount = 50;
    [testLayer addAnimation: basicAnimation forKey: @"transform"];
}

void testZPosition(CALayer *layer) {
    CALayer *testLayer = [[CALayer alloc] init];
    [layer addSublayer: testLayer];
    
    testLayer.backgroundColor = [UIColor cyanColor].CGColor;
    testLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.bounds = CGRectMake(0, 0, layer.bounds.size.width/2, layer.bounds.size.height/2);
    testLayer.zPosition = 1;
    
    CALayer *anotherLayer = [CALayer layer];
    anotherLayer.backgroundColor = [UIColor orangeColor].CGColor;
    anotherLayer.position = testLayer.position;
    anotherLayer.bounds = testLayer.bounds;
    [layer addSublayer: anotherLayer];
}

static TestCase cases[] = {
    {"anchorPoint", testAnchorPoint},
    {"backgroundColor", testBackgroundColor},
    {"borderColor", testBorderColor},
    {"borderWidth", testBorderWidth},
    {"bounds", testBounds},
    {"contents", testContents},
    {"contentsRect", testContentsRect},
    {"cornerRadius", testCornerRadius},
    {"hidden", testHidden},
    {"mask", testMask},
    {"masksToBounds", testMasksToBounds},
    {"opacity", testOpacity},
    {"position", testPosition},
    {"shadowColor", testShadowColor},
    {"shadowOffset", testShadowOffset},
    {"shadowOpacity", testShadowOpacity},
    {"shadowPath", testShadowPath},
    {"shadowRadius", testShadowRadius},
    {"sublayerTransform", testSublayerTransform},
    {"transform", testTransform},
    {"zPosition", testZPosition}
};

@interface BasicAnimationViewController ()

@end

@implementation BasicAnimationViewController

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
