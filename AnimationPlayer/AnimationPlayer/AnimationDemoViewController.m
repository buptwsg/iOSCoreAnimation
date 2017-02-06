//
//  AnimationDemoViewController.m
//  AnimationPlayer
//
//  Created by sulirong on 2017/1/19.
//  Copyright © 2017年 sulirong. All rights reserved.
//

#import "AnimationDemoViewController.h"
#import "BasicAnimationViewController.h"
#import "KeyFrameAnimationViewController.h"
#import "SpringAnimationViewController.h"
#import "TargetValueViewController.h"
#import "AnimationGroupViewController.h"

static NSString *reuseId = @"demo";

@interface AnimationDemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray<NSString*> *titleArray;

@end

@implementation AnimationDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleArray = @[@"CABasicAnimation", @"CAKeyFrameAnimation", @"CASpringAnimation", @"动画结束时保持最终值", @"CAAnimationGroup", @"Chain Animations", @"CATransition", @"CATransaction", @"CAAnimationDelegate"];
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier: reuseId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: reuseId forIndexPath: indexPath];
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    
    CaseExploreViewController *vc = nil;
    switch (row) {
        case 0:
            vc = [BasicAnimationViewController new];
            break;
            
        case 1:
            vc = [KeyFrameAnimationViewController new];
            break;
            
        case 2:
            vc = [SpringAnimationViewController new];
            break;
            
        case 3:
            vc = [TargetValueViewController new];
            break;
            
        case 4:
            vc = [AnimationGroupViewController new];
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController: vc animated: YES];
}

@end
