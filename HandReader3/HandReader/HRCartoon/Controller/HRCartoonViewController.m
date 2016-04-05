//
//  LPFCartoonViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/28.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import "HRCartoonViewController.h"
#import "HRCartoonModel.h"
#import "HRCartoonTableViewCell.h"
#import "HRCartoonDetailViewController.h"

@interface HRCartoonViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong)UITableView * HRCartoonTableView;
@property(nonatomic, strong)NSMutableArray * HRCartoonDateArray;

@end

@implementation HRCartoonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"漫画";
    self.HRCartoonDateArray = [NSMutableArray array];
    [self.view addSubview:self.HRCartoonTableView];
    [self feathNetDate];
}
#pragma mark -- 网络数据
-(void)feathNetDate{
    [[HRDataNetEngine sharedInstance]requestGetDataByUrl:HR_URL_CARTOON success:^(id respondObject) {
        //解析数据
        NSLog(@"%@",respondObject);
        [self parseData:respondObject];
    } falied:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(void)parseData:(id)respondObject{
    self.HRCartoonDateArray = [HRCartoonModel parseData:respondObject];
    [self.HRCartoonTableView reloadData];
}


#pragma mark -- tableView
-(UITableView*)HRCartoonTableView{
    if (!_HRCartoonTableView) {
        _HRCartoonTableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _HRCartoonTableView.delegate = self;
        _HRCartoonTableView.dataSource = self;
        //注册cell
        UINib * HRNib = [UINib nibWithNibName:@"HRCartoonTableViewCell" bundle:nil];
        [self.HRCartoonTableView registerNib:HRNib forCellReuseIdentifier:@"cellID"];
    }
    return _HRCartoonTableView;
}
#pragma mark --UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.HRCartoonDateArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HRCartoonTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[HRCartoonTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    HRCartoonModel * model = self.HRCartoonDateArray[indexPath.row];
    [cell upDateWithModel:model];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        HRCartoonModel * model = self.HRCartoonDateArray[indexPath.row];
    HRCartoonDetailViewController *detailVc = [[HRCartoonDetailViewController alloc] init];
    detailVc.comicid =model.comic_id;
    [self.navigationController pushViewController:detailVc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
