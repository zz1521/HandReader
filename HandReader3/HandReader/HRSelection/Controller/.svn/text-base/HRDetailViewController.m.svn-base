//
//  HRDetailViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRDetailViewController.h"
#import "HRBookDetialModel.h"
#import "HRDetailBookTableViewCell.h"
#import "HRDetailCollectionViewCell.h"
#import "HRDetailCommentTableViewCell.h"
#import "HRCommentModel.h"
@interface HRDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic)NSMutableArray *hr_allDataArray;
@property(nonatomic)NSMutableArray *hr_bookReviewArray;
@property(nonatomic)UITableView *hr_tableView;
@end

@implementation HRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchDataFromWeb];
    [self.view addSubview:self.hr_tableView];
    
}

-(void)fetchDataFromWeb{
    NSString *url = [NSString stringWithFormat:HR_URL_DETAIL,self.hr_bookId];
    [[HRDataNetEngine sharedInstance] requestGetDataByUrl:url success:^(id respondObject) {
        [self parseData:respondObject];
    } falied:^(NSError *error) {
        
    }];
    
}


-(void)parseData:(id)respondObject{
    self.hr_allDataArray = [NSMutableArray array];
    self.hr_bookReviewArray = [NSMutableArray array];
    self.hr_allDataArray = [HRBookDetialModel parseData:respondObject];
    self.hr_bookReviewArray = [HRCommentModel parseData:respondObject];
    [self.hr_tableView reloadData];
}







#pragma mark - 懒加载tableView
-(UITableView *)hr_tableView{
    if (_hr_tableView == nil) {
        _hr_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
        _hr_tableView.delegate = self;
        _hr_tableView.dataSource = self;
        [_hr_tableView registerNib:[UINib nibWithNibName:@"LPFDetailBookTableViewCell" bundle:nil] forCellReuseIdentifier:@"WAY"];
        [_hr_tableView registerNib:[UINib nibWithNibName:@"LPFDetailCommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"WAY_Comment"];
        [_hr_tableView registerNib:[UINib nibWithNibName:@"HRBookDescTableViewCell" bundle:nil] forCellReuseIdentifier:@"WAY_Desc"];
        
        
    }
    
    return _hr_tableView;
}


#pragma mark -   tableView    delegate

#pragma mark 设置组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
#pragma mark 设置每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return [self.hr_bookReviewArray count];
    }
    return 1;
}

#pragma mark 设置UITableViewCell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 1){
        HRDetailCommentTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"WAY_Comment" forIndexPath:indexPath];
        HRCommentModel *model =self.hr_bookReviewArray[indexPath.row];
        [cell updateCellByModel:model];
        return cell;
    }
    if(indexPath.section == 0){
    
    }
    
    HRDetailBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WAY" forIndexPath:indexPath];
    //[cell updateCellByModel:];
    
    if (indexPath.section == 3) {
        [cell updateCellByDataArray:self.hr_allDataArray[0][@"BookFriendsRecommend"]];
    }else if (indexPath.section == 4){
        [cell updateCellByDataArray:self.hr_allDataArray[0][@"SameRecommend"]];
        
    }else if (indexPath.section == 2){
        
        if (![self.hr_allDataArray[0][@"SameRecommend"] count]) {
            return nil;
        }
        [cell updateCellByDataArray:self.hr_allDataArray[0][@"SameRecommend"]];
        
    }
    
    return cell;
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
