//
//  HRCartoonDetailViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/4/4.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCartoonDetailViewController.h"
#import "HRCartoonComicModel.h"
#import "HRCartoonChapterListModel.h"
#import "HRCartoonHeaderViewController.h"
#import "HRCartoonReadViewController.h"
@interface HRCartoonDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)UITableView *tableView;
@property(nonatomic)NSMutableArray *dataSource;
@property(nonatomic)NSMutableArray *comic_dataSource;
@property(nonatomic)NSMutableArray *chapter_dataSource;

@property(nonatomic)HRCartoonComicModel *comicModel;
@end

@implementation HRCartoonDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = [NSMutableArray array];
    self.comic_dataSource = [NSMutableArray array];
    self.chapter_dataSource = [NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self fetchNetData];

}

-(void)fetchNetData{
    NSString *url = [NSString stringWithFormat:HR_URL_CARTOON_DETAL,self.comicid];
    
[[HRDataNetEngine sharedInstance] requestGetDataByUrl:url success:^(id respondObject) {
    NSDictionary *returnDic =respondObject[@"data"][@"returnData"];
    
    //self.comicModel =[[HRCartoonComicModel alloc] init];
 
    self.comicModel = [[HRCartoonComicModel alloc] initWithDictionary:returnDic[@"comic"] error:nil];
    self.tableView.tableHeaderView = [[HRCartoonHeaderViewController alloc] initWithModel:self.comicModel].view;
    self.chapter_dataSource = [HRCartoonChapterListModel parseData:returnDic[@"chapter_list"]];
    [self.tableView reloadData];
} falied:^(NSError *error) {
    
}];

}




#pragma mark - 懒加载tableVIew
-(UITableView *)tableView{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, HR_WIDTH_SCRENN, HR_HEIGHT_SCRENN);
        _tableView = [[UITableView alloc] initWithFrame:frame style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
//        [_tableView registerNib:[UINib nibWithNibName:@"HRCartoonHeaderViewController" bundle:nil] forHeaderFooterViewReuseIdentifier:@"hearder"];
//      
        //_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.chapter_dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WAY"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"WAY"];
    }
    HRCartoonChapterListModel *model = self.chapter_dataSource[indexPath.row];
    cell.textLabel.text = model.name;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HRCartoonChapterListModel *model = self.chapter_dataSource[indexPath.row];
    HRCartoonReadViewController *readVC = [[HRCartoonReadViewController alloc] init];
    readVC.chapter_id = model.chapter_id;
    [self.navigationController pushViewController:readVC animated:YES];
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
