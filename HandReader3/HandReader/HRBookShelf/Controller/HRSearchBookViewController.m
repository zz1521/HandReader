//
//  HRSearchBookViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/4/3.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRSearchBookViewController.h"
#import "HRBookListViewController.h"
#import "HRCategaryBookListModel.h"
@interface HRSearchBookViewController ()<UISearchBarDelegate>
@property(nonatomic)UISearchBar *hr_searchBar;
@property(nonatomic)NSMutableArray *dataArray;
@property(nonatomic)NSString *dataSource;
@property(nonatomic)NSInteger page;
@end

@implementation HRSearchBookViewController

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSearchBar];
    
}

-(void)fetchDataFromWeb:(NSString *)name{
    //searchtype=articlename&searchkey=%@&submit=
    NSString *url = [NSString stringWithFormat:HR_CATEGARY_SEARCH ,name,self.page];
    [[HRDataNetEngine sharedInstance]requestPostDataByUrl:url parameter:nil success:^(id respondObject) {
        [self parseData:respondObject];
    } falied:^(NSError *error) {
        
    }];
    
}


-(void)parseData:(id)respondObject{
    self.dataArray = [NSMutableArray array];
    self.dataArray = [HRCategaryBookListModel parseData:respondObject];
    HRBookListViewController *bookListVC = [[HRBookListViewController alloc] init];
    bookListVC.hidesBottomBarWhenPushed = YES;
    bookListVC.sendArray = [NSMutableArray array];
    bookListVC.sendArray = self.dataArray;
    bookListVC.pageType = @"Search";
    bookListVC.sendTitle = [NSString stringWithFormat:@"Search:%@",self.hr_searchBar.text];
    [self.navigationController pushViewController:bookListVC animated:YES];

}








-(void)createSearchBar{
    //self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    self.hr_searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, HR_WIDTH_SCRENN-180, 40)];
    self.hr_searchBar.delegate = self;
    self.hr_searchBar.placeholder = @"请输入您搜索的关键词";
    self.navigationItem.titleView =self.hr_searchBar;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%@",searchBar.text);
    [self.hr_searchBar resignFirstResponder];
    [self fetchDataFromWeb:searchBar.text];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.hr_searchBar resignFirstResponder];
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
