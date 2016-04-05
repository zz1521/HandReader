//
//  HRSelectionViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/28.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import "HRSelectionViewController.h"
#import "HRSaveBookTableViewCell.h"



@interface HRSelectionViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic)UITableView *tabelView;
@property(nonatomic)NSMutableArray *dataSource;

@end

@implementation HRSelectionViewController

-(void)viewWillAppear:(BOOL)animated{
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的书架";
    NSDictionary *attributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
    //NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:(UIBarMetricsDefault)];
    self.dataSource = [NSMutableArray array];
    [self.view addSubview:self.tabelView];
    [self loadData];
}





-(void)loadData{

    [self.dataSource removeAllObjects];
    NSArray *array = [[HRDBManager sharedInstance] allCollectBook];
    for (HRSaveBookModel * model  in array) {
        [self.dataSource addObject:model];
    }
    [self.tabelView reloadData];
}



-(void)updateData{
    [self loadData];
}


-(UITableView *)tabelView{
    if (_tabelView == nil) {
        _tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, HR_WIDTH_SCRENN, HR_HEIGHT_SCRENN) style:(UITableViewStylePlain)];
        self.tabelView.delegate = self;
        self.tabelView.dataSource = self;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:_tabelView.bounds];
        imageView.image = [UIImage imageNamed:@"sharebg"];
        self.tabelView.backgroundView =imageView;
        [self.tabelView registerNib:[UINib nibWithNibName:@"HRSaveBookTableViewCell" bundle:nil] forCellReuseIdentifier:@"WAY"];
    }
    return _tabelView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([self.dataSource count] / 3 < 4) {
        return 4;
    }
    
    if ([self.dataSource count] % 3 != 0) {
        return [self.dataSource count] / 3 + 1;
    }
    
    return [self.dataSource count] / 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HRSaveBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WAY" forIndexPath:indexPath];
    [cell updateCellBydataSource:self.dataSource indexPath:indexPath];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
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
