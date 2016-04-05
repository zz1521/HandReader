//
//  HRBookListViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/29.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRBookListViewController.h"
#import "HRBookListModel.h"
#import "HRBookListTableViewCell.h"
#import "HRBookDetailViewController.h"
#import "HRCategaryBookListModel.h"

@interface HRBookListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)BOOL isLoadMore;
@property(nonatomic)BOOL isRefreshing;

@property(nonatomic)NSInteger page;
@property(nonatomic)UITableView *tableView;
@property(nonatomic)NSMutableArray *dataSource;
//flag 标志以何种方式进入
@property(nonatomic)NSInteger flag;

@end

@implementation HRBookListViewController

#pragma mark - 添加刷新头
-(void)createRefreshHeadView{
    __weak typeof(self) wself = self;
    
    [wself.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (wself.isRefreshing) {
            return ;
        }
        if(wself.flag == 2){
            [wself.tableView headerEndRefreshingWithResult:(JHRefreshResultSuccess)];
        }else{
            wself.isRefreshing = YES;
            wself.page = 0;
            [wself fetchDataFromWeb];
        }
        
    }];
}


-(void)createRefreshFootView{
    __weak typeof(self) wself = self;
    [wself.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (wself.isLoadMore) {
            return ;
        }
        if(wself.flag == 2){
             [wself.tableView footerEndRefreshing];
        }else{
            wself.isLoadMore = YES;
            wself.page++;
            [wself fetchDataFromWeb];
        }

    }];
}

#pragma mark - 结束刷新
-(void)endRefresh{
    if (self.isRefreshing) {
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
        self.isRefreshing = NO;
    }
    if (self.isLoadMore) {
        self.isLoadMore = NO;
        [self.tableView footerEndRefreshing];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.page = 0;
    self.flag = 0;
     [self.view addSubview:self.tableView];
    [self createRefreshHeadView];
    [self createRefreshFootView];
    self.dataSource = [NSMutableArray array];
    if ([self.categary length] > 0 && ![self.categary isEqualToString:@"Rank"]) {
        //分类页进入
        self.flag = 1;
        [self fetchDataFromWeb];
    }else if ([self.pageType isEqualToString:@"Search"]){
        //搜索页进入
        self.flag = 2;
        self.dataSource = self.sendArray;
        [self.tableView reloadData];
    }else{
        //排行页进入
        self.flag = 0;
        [self fetchDataFromWeb];
    }
    
 
   
   
}

-(void)fetchDataFromWeb{
    NSString *url = [NSString string];
    if (self.flag == 1) {
        url = [NSString stringWithFormat:HR_CATEGARY_SEARCH,self.categary,self.page];
    }else{
        url = [NSString stringWithFormat:HR_URL_BOOKLIST,(long)self.type,(long)self.ranktype,(long)self.page];
    }
    NSLog(@"url = %@",url);
    [[HRDataNetEngine sharedInstance] requestGetDataByUrl:url success:^(id respondObject) {
        
        if (self.page == 0) {
            [self.dataSource removeAllObjects];
        }
        [self parseData:respondObject];
        //NSLog(@"%@",respondObject);
        
    } falied:^(NSError *error) {
        [self endRefresh];
    }];
    
}


-(void)parseData:(id)respondObject{
    if (self.flag == 0) {
           [self.dataSource addObjectsFromArray:[HRBookListModel parseData:respondObject]];
    }else{
        [self.dataSource addObjectsFromArray:[HRCategaryBookListModel parseData:respondObject]];
    }

    [self.tableView reloadData];
    [self endRefresh];
}

#pragma mark - 懒加载tableVIew
-(UITableView *)tableView{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, HR_WIDTH_SCRENN, HR_HEIGHT_SCRENN);
        _tableView = [[UITableView alloc] initWithFrame:frame style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"HRBookListTableViewCell" bundle:nil] forCellReuseIdentifier:@"WAY"];
    }
    return _tableView;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HRBookListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WAY" forIndexPath:indexPath];
    
    if (self.flag == 1 || self.flag == 2) {
        HRCategaryBookListModel *model =self.dataSource[indexPath.row];
        //search页面跳转过来
        if (self.pageType.length >0) {
           self.navigationItem.title = self.sendTitle;
        }else{
            self.navigationItem.title = model.category;
        }
        [cell updateCategaryCellByModel:model];
    }else{
        HRBookListModel *model = self.dataSource[indexPath.row];
        self.navigationItem.title =self.sendTitle;
        [cell updateCellByModel:model];
    }
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 128;
}


#pragma mark - 点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HRBookDetailViewController *detailVC = [[HRBookDetailViewController alloc] init];

    //NSLog(@"%@",self.sendTitle);
    //通过categary 是否有值，判断进入的入口，根据不同入口，使用不同的model
    if (self.categary.length > 0) {
        HRBookListModel *model = self.dataSource[indexPath.row];
        detailVC.gid = model.gid;
        detailVC.sendTitle = model.book_name;
    }else{
        HRCategaryBookListModel *model = self.dataSource[indexPath.row];
        detailVC.gid = model.gid;
        detailVC.sendTitle = model.name;
    }
    [self.navigationController pushViewController:detailVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
