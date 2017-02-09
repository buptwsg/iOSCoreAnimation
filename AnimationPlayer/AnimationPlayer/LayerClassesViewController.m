//
//  LayerClassesViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/8.
//  Copyright © 2017年 sulirong. All rights reserved.
//

@import AVFoundation;

#import "LayerClassesViewController.h"

void testShapeLayer_1(CALayer *layer) {
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.fillColor = [UIColor clearColor].CGColor;
    circleLayer.lineWidth = 20.0f;
    circleLayer.lineCap = kCALineCapRound;
    circleLayer.lineJoin = kCALineJoinRound;
    circleLayer.strokeColor = [UIColor redColor].CGColor;
    [layer addSublayer: circleLayer];
    
    CGPoint center = CGPointMake(layer.bounds.size.width / 2, 300);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter: center radius: 80 startAngle: 0 endAngle: M_PI*2 clockwise: NO];
    circleLayer.path = path.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 3;
    [circleLayer addAnimation: animation forKey: nil];
    
    int count = 16;
    for (int i = 0; i < count; i++) {
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.strokeColor = [UIColor yellowColor].CGColor;
        lineLayer.lineWidth = 15.0;
        lineLayer.lineCap = kCALineCapRound;
        lineLayer.lineJoin = kCALineJoinRound;
        [layer addSublayer: lineLayer];
        
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        int x = center.x + 100 * cos(2 * M_PI / count * i);
        int y = center.y - 100 * sin(2 * M_PI / count * i);
        int len = 50;
        [linePath moveToPoint: CGPointMake(x, y)];
        [linePath addLineToPoint: CGPointMake(x + len * cos(2 * M_PI / count * i), y - len * sin(2 * M_PI / count * i))];
        lineLayer.path = linePath.CGPath;
        [lineLayer addAnimation: animation forKey: nil];
    }
}

void testShapeLayer_2(CALayer *layer) {
    CGPoint startPoint = CGPointMake(50, 300);
    CGPoint endPoint = CGPointMake(300, 300);
    CGPoint controlPoint = CGPointMake(170, 200);
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    layer1.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    layer2.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [path moveToPoint: startPoint];
    [path addQuadCurveToPoint: endPoint controlPoint: controlPoint];
    
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    
    [layer addSublayer: layer1];
    [layer addSublayer: layer2];
    [layer addSublayer: layer3];
    [layer addSublayer: shapeLayer];
}

void testShapeLayer_3(CALayer *layer) {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path addArcWithCenter:CGPointMake(150, 100) radius:25 startAngle:0 endAngle:2*M_PI clockwise:YES]; //上方的圆
    [path moveToPoint:CGPointMake(150, 125)];//移动到圆的正下方
    [path addLineToPoint:CGPointMake(150, 175)];//竖的线，添加完以后绘制点在竖线的末尾
    [path addLineToPoint:CGPointMake(125, 225)];//左边的斜线
    [path moveToPoint:CGPointMake(150, 175)]; //移动到竖线的末尾
    [path addLineToPoint:CGPointMake(175, 225)];//右边的斜线
    [path moveToPoint:CGPointMake(100, 150)];//准备画横线
    [path addLineToPoint:CGPointMake(200, 150)];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = path.CGPath;
    
    [layer addSublayer:shapeLayer];
}

void testShapeLayer_4(CALayer *layer) {
    CGRect rect = CGRectMake(layer.bounds.size.width/2, 200, 100, 100);
    CGSize radii = CGSizeMake(10, 10);
    
    UIRectCorner corners = UIRectCornerTopRight | UIRectCornerBottomLeft;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect
                                               byRoundingCorners:corners
                                                     cornerRadii:radii];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.path = path.CGPath;
    [layer addSublayer:shapeLayer];
}

void testTextLayer(CALayer *layer) {
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(0, 200, layer.bounds.size.width, 100);
    textLayer.string = @"This layer is very simple";
    textLayer.wrapped = YES;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.foregroundColor = [UIColor orangeColor].CGColor;
    [layer addSublayer: textLayer];
}

void testGradientLayerVertical(CALayer *layer) {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = CGRectMake(0, 0, 200, 200);
    gradientLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    // 设置渐变的颜色, 理论上来讲是无限添加的
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor,
                             (__bridge id)[UIColor blueColor].CGColor];
    
    gradientLayer.startPoint = CGPointMake(0.5, 0); // 开始渐变的点
    gradientLayer.endPoint = CGPointMake(0.5, 1); // 结束渐变的点
    
    gradientLayer.locations = @[@0.0, @0.4, @0.8]; // 设置渐变的区域
    
    [layer addSublayer:gradientLayer];
}

void testGradientLayerHorizontal(CALayer *layer) {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = CGRectMake(0, 0, 200, 200);
    gradientLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    // 设置渐变的颜色, 理论上来讲是无限添加的
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor,
                             (__bridge id)[UIColor blueColor].CGColor];
    
    gradientLayer.startPoint = CGPointMake(0, 0.5); // 开始渐变的点
    gradientLayer.endPoint = CGPointMake(1, 0.5); // 结束渐变的点
    
    gradientLayer.locations = @[@0.0, @0.4, @0.8]; // 设置渐变的区域
    
    [layer addSublayer:gradientLayer];
}

void testGradientLayer(CALayer *layer) {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = CGRectMake(0, 0, 200, 200);
    gradientLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/2);
    
    // 设置渐变的颜色, 理论上来讲是无限添加的
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor,
                             (__bridge id)[UIColor blueColor].CGColor];
    
    gradientLayer.startPoint = CGPointMake(0, 0); // 开始渐变的点
    gradientLayer.endPoint = CGPointMake(1, 1); // 结束渐变的点
    
    gradientLayer.locations = @[@0.0, @0.4, @0.8]; // 设置渐变的区域
    
    [layer addSublayer:gradientLayer];
}

void testReplicatorLayer(CALayer *layer) {
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    [layer addSublayer: replicatorLayer];
    
    replicatorLayer.bounds = CGRectMake(0, 0, 100, 100);
    replicatorLayer.position = CGPointMake(layer.bounds.size.width/2, layer.bounds.size.height/4.5);
    replicatorLayer.instanceCount = 10;  // 复制图层个数
    replicatorLayer.instanceBlueOffset = -1.0f; // 设置每一个图层的逐渐蓝色偏移
    replicatorLayer.instanceRedOffset = -1.0f;  // 设置每一个图层的逐渐红色偏移
    replicatorLayer.instanceAlphaOffset = -0.1f;
    replicatorLayer.instanceDelay = 0.33f;  // 设置每个图层延迟0.33f
    replicatorLayer.instanceTransform = transform;
    
    CALayer *instanceLayer = [CALayer layer];
    instanceLayer.frame = CGRectMake(0, 0, 100, 100);
    instanceLayer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicatorLayer addSublayer:instanceLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation.toValue =  @(instanceLayer.position.y - 25.0);
    animation.duration = 0.5;
    animation.autoreverses = true;
    animation.repeatCount = INT_MAX;
    
    [instanceLayer addAnimation:animation forKey:nil];
}

void testReflection(CALayer *layer) {
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceCount = 2;
    replicatorLayer.frame = CGRectMake(50, 200, 100, 100);
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"event_pop_sun"].CGImage);
    imageLayer.frame = replicatorLayer.bounds;
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, imageLayer.bounds.size.height, 0);
    transform = CATransform3DScale(transform, 1, -1, 0);
    
    replicatorLayer.instanceTransform = transform;
    replicatorLayer.instanceAlphaOffset = -0.6;
    
    [replicatorLayer addSublayer: imageLayer];
    [layer addSublayer: replicatorLayer];
}

void testEmitterLayer(CALayer *layer) {
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    
    emitterLayer.frame = CGRectMake(0, 150, layer.bounds.size.width, layer.bounds.size.height);
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width / 2,
                                               emitterLayer.frame.size.height / 2);
    [layer addSublayer:emitterLayer];
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"fire"].CGImage);
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1.f
                                 green:0.5f
                                  blue:0.1f
                                 alpha:1.0f].CGColor;
    cell.alphaSpeed = -0.4f;
    cell.velocity = 50.f;
    cell.velocityRange = 50.f;
    cell.emissionRange = M_PI * 2.0f;
    
    emitterLayer.emitterCells = @[cell];
}

void testAVPlayerLayer(CALayer *layer) {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"demo0"
                                         withExtension:@"m4v"];
    
    AVPlayer *player = [AVPlayer playerWithURL:url];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    
    playerLayer.frame = CGRectMake(0, 0, layer.bounds.size.width, layer.bounds.size.height);
    
    [layer addSublayer:playerLayer];
    
    [player play];
}

static TestCase cases[] = {
    {"Shape Layer Demo 1", testShapeLayer_1},
    {"Shape Layer Demo 2", testShapeLayer_2},
    {"Shape Layer Demo 3", testShapeLayer_3},
    {"Shape Layer Demo 4", testShapeLayer_4},
    {"Text Layer", testTextLayer},
    {"Gradient Layer Vertical", testGradientLayerVertical},
    {"Gradient Layer Horizontal", testGradientLayerHorizontal},
    {"Gradient Layer 45 degree", testGradientLayer},
    {"Replicator Layer Demo 1", testReplicatorLayer},
    {"Reflection using ReplicatorLayer", testReflection},
    {"EmitterLayer", testEmitterLayer},
    {"AVPlayerLayer", testAVPlayerLayer}
};

@interface LayerClassesViewController ()

@end

@implementation LayerClassesViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
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
