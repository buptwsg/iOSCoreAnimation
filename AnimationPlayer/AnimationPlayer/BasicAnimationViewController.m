//
//  BasicAnimationViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/1/20.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "BasicAnimationViewController.h"

static TestCase cases[] = {
    {"anchorPoint", NULL},
    {"backgroundColor", NULL},
    {"borderColor", NULL},
    {"borderWidth", NULL},
    {"bounds", NULL},
    {"contents", NULL},
    {"contentsRect", NULL},
    {"cornerRadius", NULL},
    {"hidden", NULL},
    {"mask", NULL},
    {"masksToBounds", NULL},
    {"opacity", NULL},
    {"position", NULL},
    {"shadowColor", NULL},
    {"shadowOffset", NULL},
    {"shadowOpacity", NULL},
    {"shadowPath", NULL},
    {"shadowRadius", NULL},
    {"sublayers", NULL},
    {"sublayerTransform", NULL},
    {"transform", NULL},
    {"zPosition", NULL}
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
