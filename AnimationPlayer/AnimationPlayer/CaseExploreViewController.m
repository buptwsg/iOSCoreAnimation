//
//  CaseExploreViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/1/20.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "CaseExploreViewController.h"

@interface CaseExploreViewController ()

@end

@implementation CaseExploreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"用例浏览";
    
    UIButton *nextButton = [[UIButton alloc] init];
    [self.view addSubview: nextButton];
    [nextButton setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
    [nextButton setTitle: @"下一个" forState: UIControlStateNormal];
    [nextButton addTarget: self action: @selector(nextCase) forControlEvents: UIControlEventTouchUpInside];
    [nextButton sizeToFit];
    nextButton.center = CGPointMake(self.view.bounds.size.width - 12 - nextButton.bounds.size.width/2, self.view.bounds.size.height/2);
    
    UIButton *prevButton = [[UIButton alloc] init];
    [self.view addSubview: prevButton];
    [prevButton setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
    [prevButton setTitle: @"上一个" forState: UIControlStateNormal];
    [prevButton addTarget: self action: @selector(prevCase) forControlEvents: UIControlEventTouchUpInside];
    [prevButton sizeToFit];
    prevButton.center = CGPointMake(12 + prevButton.bounds.size.width/2, self.view.bounds.size.height/2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)nextCase {
    
}

- (void)prevCase {
    
}

@end
