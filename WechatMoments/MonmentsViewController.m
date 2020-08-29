//// MonmentsViewController.m
// WechatMoments
//
// Copyright © 2020 ymc. All rights reserved.
//


#import "MonmentsViewController.h"

@interface MonmentsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation MonmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"朋友圈";
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildTheMainPage];
    // Do any additional setup after loading the view.
}

- (void)buildTheMainPage {
    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
//分区，组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//每个分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
////每个单元格的内容
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
////    return cell;
//}

@end
