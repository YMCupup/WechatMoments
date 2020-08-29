//// MonmentsViewController.m
// WechatMoments
//
// Copyright © 2020 ymc. All rights reserved.
//


#import "MonmentsViewController.h"
#import "MonmentsHeadView.h"
@interface MonmentsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *tableview;
@property (nonatomic ,strong)NSMutableArray *dataArray;
@property (nonatomic ,strong)MonmentsHeadView *headview;
@end

@implementation MonmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"朋友圈";
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildTheMainPage];
    [self RequestNetworkData];
    // Do any additional setup after loading the view.
}

- (void)buildTheMainPage {
    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableview.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.tableview];
    
    self.tableview.tableHeaderView = self.headview;
}

- (void)RequestNetworkData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *params = @{};

    [manager POST:@"https://thoughtworks-mobile-2018.herokuapp.com/user/jsmith" parameters:params headers:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功---%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败---%@", error);
    }];
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


- (MonmentsHeadView *)headview {
    if (!_headview){
        _headview = [[MonmentsHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 250)];
    }
    return _headview;
}
@end
