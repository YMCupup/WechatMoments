//// ViewController.m
// WechatMoments
//
// Copyright © 2020 ymc. All rights reserved.
//


#import "ViewController.h"
#import "MonmentsViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildTheMainPage];
    // Do any additional setup after loading the view.
}

- (void)buildTheMainPage {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 150, 40);
    button.center = self.view.center;
    [button setTitle:@"点击进入朋友圈" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button addTarget:self action:@selector(PushMonmentsCon) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)PushMonmentsCon {
    MonmentsViewController * monmentVc = [[MonmentsViewController alloc] init];
    [self.navigationController pushViewController:monmentVc animated:YES];
}

@end
