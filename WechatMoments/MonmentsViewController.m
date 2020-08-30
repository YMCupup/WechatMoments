//// MonmentsViewController.m
// WechatMoments
//
// Copyright © 2020 ymc. All rights reserved.
//


#import "MonmentsViewController.h"
#import "MonmentsHeadView.h"
#import "MonmentsTableViewCell.h"
#import "UserInfoModel.h"
#import "DataListModel.h"
@interface MonmentsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *tableview;
@property (nonatomic ,strong)NSMutableArray *dataArray;
@property (nonatomic ,strong)MonmentsHeadView *headview;

@property (nonatomic ,strong)UserInfoModel * userModel;

@end

@implementation MonmentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"朋友圈";
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildTheMainPage];
    [self RequestNetworkData];
    [self RequestNetworkUserInfoData];
    // Do any additional setup after loading the view.
}

- (void)buildTheMainPage {
    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableview.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.showsVerticalScrollIndicator = NO;
    [self.tableview  setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableview.backgroundColor = [UIColor clearColor];
    self.tableview.backgroundView.backgroundColor = [UIColor clearColor];
    [self.tableview registerClass:[MonmentsTableViewCell class] forCellReuseIdentifier:@"MonmentsTableViewCell"];
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    self.tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    [self.view addSubview:self.tableview];
    self.tableview.tableHeaderView = self.headview;
}

- (void)RequestNetworkUserInfoData {
    NSData *data = [NSData dataNamed:[NSString stringWithFormat:@"userinfo.json"]];
    self.userModel = [UserInfoModel modelWithJSON:data];
    self.headview.model = self.userModel;
}

- (void)RequestNetworkData {
    NSData *data = [NSData dataNamed:[NSString stringWithFormat:@"datalist.json"]];
    NSArray *dataary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:NULL];
    NSArray *listArray = [DataListModel mj_objectArrayWithKeyValuesArray:dataary];
    for (DataListModel * listmodel in listArray) {
        [listmodel CalculateHeightAndPicture];
    }
    [self.dataArray addObjectsFromArray:listArray];
    [self.tableview reloadData];
}



- (void)refreshData{
}

- (void)loadMoreData{
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MonmentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MonmentsTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//点击无反应
    DataListModel * model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark - Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataListModel * model = self.dataArray[indexPath.row];
    return model.cellHeight;
}

- (MonmentsHeadView *)headview {
    if (!_headview){
        _headview = [[MonmentsHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    }
    return _headview;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
