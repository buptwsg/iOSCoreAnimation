//
//  KeyFrameAnimationViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/4.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "KeyFrameAnimationViewController.h"

void testCGPointWithArray(CALayer *layer) {
    
}

void testCGPointWithPath(CALayer *layer) {
    
}

void testCGRect(CALayer *layer) {
    
}

void testTransformWithKeyframe(CALayer *layer) {
    
}

void testNumber(CALayer *layer) {
    
}

void testColor(CALayer *layer) {
    
}

void testContentsWithKeyframe(CALayer *layer) {
    
}

static TestCase cases[] = {
    {"animate CGPoint properties with array", testCGPointWithArray},
    {"animate CGPoint properties with path", testCGPointWithPath},
    {"animate CGRect properties", testCGRect},
    {"animate transform properties", testTransformWithKeyframe},
    {"animate number properties", testNumber},
    {"animate color properties", testColor},
    {"animate contents", testContentsWithKeyframe}
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
