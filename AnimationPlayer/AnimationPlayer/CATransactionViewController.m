//
//  CATransactionViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/2/7.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "CATransactionViewController.h"

static TestCase cases[] = {
    {"Rotate and Move", NULL},
    {"Rotate and Move: rotate duration shorter", NULL},
    {"Rotate and Move: rotate is clipped", NULL}
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
