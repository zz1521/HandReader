//
//  HRBookshelfViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/28.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import "HRBookshelfViewController.h"
#import "HRCategaryModel.h"
#import "HRBookShelfModel.h"
#import "HRBookShelfTableViewCell.h"
#import "HRBookListViewController.h"
#import "HRCategaryBookListModel.h"
#import "HRBookListViewController.h"
#import "HRSearchBookViewController.h"

@interface HRBookshelfViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic)UITableView *tableView;
@property(nonatomic)UITableView *categaryTableView;

@property(nonatomic)NSMutableArray *dataSource;
@property(nonatomic)NSMutableArray *categaryDataSource;
@property(nonatomic)NSMutableArray *categaryListSource;
@property(nonatomic)NSInteger page;
@property(nonatomic)NSInteger flag;



@end

@implementation HRBookshelfViewController


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.flag = 0;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavegation];
    self.flag = 0;
    self.page = 0;
    self.dataSource = [NSMutableArray array];
    self.categaryDataSource = [NSMutableArray array];
    self.categaryListSource = [NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self fetchNetData:HR_RANK];
    
    [self.view addSubview:self.categaryTableView];
    [self.view bringSubviewToFront:self.categaryTableView];
    self.categaryTableView.hidden = YES;
    
}







#pragma mark - 设置Navegation
-(void)setNavegation{
    UILabel *label = [HRFactory createLabelWithTitle:@"书库" frame:CGRectMake(0, 0, 50, 30) fontSize: 23];
    self.navigationItem.titleView = label;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 30);
    button.tag = 99;
    [button setBackgroundImage:[UIImage imageNamed:@"up"] forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(categaryTableViewAction:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = buttonItem;
    
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 50, 30);
    rightButton.tag = 88;
    rightButton.backgroundColor = [UIColor lightGrayColor];
    [rightButton setTitle:@"搜索" forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(categaryTableViewAction:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
}

#pragma mark - 设置分类按钮的点击事件
-(void)categaryTableViewAction:(UIButton *)button{
    
    if (button.tag == 99) {
        if(_categaryTableView.hidden == YES){
            _categaryTableView.hidden = NO;
            [button setBackgroundImage:[UIImage imageNamed:@"down"] forState:(UIControlStateNormal)];
            [self fetchNetData:HR_CATEGARY];
        }else{
            _categaryTableView.hidden = YES;
            [button setBackgroundImage:[UIImage imageNamed:@"up"] forState:(UIControlStateNormal)];
        }
    }else{
        
        HRSearchBookViewController *searchVC = [[HRSearchBookViewController alloc] init];
        searchVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:searchVC animated:YES];
    }
    
}



#pragma mark - 网络请求
-(void)fetchNetData:(NSString *)parameter{
    NSString *url = [NSString stringWithFormat:HR_URL_BOOKSHELF,parameter];
    [[HRDataNetEngine sharedInstance] requestGetDataByUrl:url success:^(id respondObject) {
        [self parseData:parameter respondObject:respondObject];
        
    } falied:^(NSError *error) {
        
    }];
}

#pragma mark - 解析数据
-(void)parseData:(NSString *)parameter respondObject:(id)respondObject{
    if ([parameter isEqualToString:HR_CATEGARY]) {
        self.categaryDataSource = [HRCategaryModel parseData:respondObject];
        [self.categaryTableView reloadData];
    }else{
        self.dataSource = [HRBookShelfModel parseData:respondObject];
        [self.tableView reloadData];
    }
}



#pragma mark - 懒加载tableVIew
-(UITableView *)tableView{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, HR_WIDTH_SCRENN, HR_HEIGHT_SCRENN);
        _tableView = [[UITableView alloc] initWithFrame:frame style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"HRBookShelfTableViewCell" bundle:nil] forCellReuseIdentifier:@"WAY"];
    }
    return _tableView;
}

#pragma mark - 对分类tableView进行懒加载
-(UITableView *)categaryTableView{
    if (_categaryTableView == nil) {
        CGRect frame = CGRectMake(0, 64, 90, HR_HEIGHT_SCRENN - 64 - 49);
        _categaryTableView = [[UITableView alloc] initWithFrame:frame style:(UITableViewStylePlain)];
        _categaryTableView.delegate =self;
        _categaryTableView.dataSource = self;
        _categaryTableView.backgroundColor = [UIColor clearColor];//HR_RGBA(249, 215, 150,0.5);
        _categaryTableView.showsVerticalScrollIndicator = NO;
    }
    return _categaryTableView;
}




#pragma mark - tableView delegate
#pragma mark  设置行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.categaryTableView) {
        return self.categaryDataSource.count;
    }
    
    return self.dataSource.count;
}
#pragma mark  设置cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.categaryTableView) {

        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WAY_1"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"WAY_1"];
            UIImageView *imageView =[[UIImageView alloc] initWithFrame:cell.bounds];
            if (indexPath.row % 2 == 0) {
                imageView.image = [UIImage imageNamed:@"bg1"];
            }else{
                imageView.image = [UIImage imageNamed:@"bg2"];
            }
            
            cell.backgroundView =imageView;
        }
        HRCategaryModel *model = self.categaryDataSource[indexPath.row];
        cell.textLabel.text = model.category;
        cell.textLabel.font = [UIFont systemFontOfSize:17];
        cell.textLabel.center = cell.center;
        cell.textLabel.textColor = [UIColor magentaColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = HR_RGBA(249, 215, 150,0.3);
        return cell;
    }
    

    

    HRBookShelfTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WAY" forIndexPath:indexPath];
        HRBookShelfModel *model = self.dataSource[indexPath.row];
        cell.backgroundColor = HR_RGB(249, 215, 150);
        [cell updateCellByModel:model];
   
    for (UIView *view in cell.contentView.subviews) {
        //NSLog(@"%ld",[cell.contentView.subviews count]);
        if (view.tag == 999) {
            [view removeFromSuperview];
            //NSLog(@"%ld",[cell.contentView.subviews count]);
        }
    }
    
    UIImageView *imageView =[[UIImageView alloc] initWithFrame:cell.bounds];
    imageView.tag = 999;
    imageView.image = [UIImage imageNamed:@"cell_bg"];
    cell.backgroundView =imageView;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
HRBookListViewController *bookListVC = [[HRBookListViewController alloc] init];
    if(tableView == self.tableView){
        HRBookShelfModel *model = self.dataSource[indexPath.row];

        bookListVC.categary = @"Rank";
        bookListVC.ranktype = model.ranktype;
        bookListVC.type = model.type;
        bookListVC.sendTitle = model.rankName;
        bookListVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:bookListVC animated:YES];
    }else{
        HRCategaryModel *model = self.categaryDataSource[indexPath.row];
        self.categaryTableView.hidden = YES;
        [self.navigationItem.leftBarButtonItem setBackgroundImage:[UIImage imageNamed:@"up"] forState:(UIControlStateNormal) barMetrics:(UIBarMetricsDefault)];
        bookListVC.categary = model.category;
        [self.navigationController pushViewController:bookListVC animated:YES];
    }

}

//-(void)fetchCategaryNetData:(NSString *)category{
//    
//    NSString *url = [NSString stringWithFormat:HR_CATEGARY_SEARCH,category,self.page];
//    [[HRDataNetEngine sharedInstance] requestGetDataByUrl:url success:^(id respondObject) {
//        [self parseData:respondObject];
//        
//    } falied:^(NSError *error) {
//        
//    }];
//}
//
//-(void)parseData:(id)respondObject{
//    self.categaryListSource = [HRCategaryBookListModel parseData:respondObject];
//   ;
//    bookListVC.hidesBottomBarWhenPushed = YES;
//    bookListVC.sendArray = [NSMutableArray array];
//    bookListVC.sendArray = self.categaryListSource;
// 
//}
//


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
