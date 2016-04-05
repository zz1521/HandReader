//
//  HRChaptersViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/30.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRChaptersViewController.h"
#import "HRChaptersModel.h"
#import "HRReadViewController.h"

@interface HRChaptersViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)UITableView *tableView;
@property(nonatomic)NSMutableArray *dataSource;

@end

@implementation HRChaptersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.view addSubview:self.scrollView];
    self.dataSource = [NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self fetchDataFromWeb];
}

-(void)fetchDataFromWeb{
    NSString *url = [NSString stringWithFormat:HR_URL_CHAPTERLIST,self.gid,self.nid];
[[HRDataNetEngine sharedInstance] requestGetDataByUrl:url success:^(id respondObject) {
    self.dataSource  = [HRChaptersModel parseData:respondObject];
    [self.tableView reloadData];
} falied:^(NSError *error) {
    
}];


}


-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, HR_WIDTH_SCRENN, HR_HEIGHT_SCRENN )];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
    }
    return _tableView;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"WAY"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"WAY"];
    }
    HRChaptersModel *model = self.dataSource[indexPath.row];
    cell.textLabel.text = model.chapter_name;
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
   HRChaptersModel *model = self.dataSource[indexPath.row];
    HRReadViewController *readVc = [[HRReadViewController alloc] init];
    readVc.sort = model.sort;
    readVc.gid = model.gid;
    readVc.nid = model.nid;
    readVc.chapter_name = model.chapter_name;
    [[HRDBManager sharedInstance] updateCollectBook:model]; 
    [self.navigationController pushViewController:readVc animated:YES];
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
