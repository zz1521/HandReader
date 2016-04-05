//
//  HRBookDetailViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/30.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRBookDetailViewController.h"
#import "HRChaptersViewController.h"
#import "HRSaveBookModel.h"
@interface HRBookDetailViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButton;



@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *authourNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *categaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;

@property(nonatomic)HRSaveBookModel *saveBookModel;
@property(nonatomic)id dataSource;
@property(nonatomic)NSInteger nid;

@end

@implementation HRBookDetailViewController
- (IBAction)firstWords:(id)sender {
    self.saveBookModel = [[HRSaveBookModel alloc] init];
    self.saveBookModel.img_url =self.dataSource[@"img_url"];
    //[self.iconImageView sd_setImageWithURL:[NSURL URLWithString:respondObject[@"img_url"]]];
    self.saveBookModel.name = self.dataSource[@"name"];
    self.saveBookModel.author = self.dataSource[@"author"];
   // self.dateLabel.text =[NSString stringWithFormat:@"%@",self.dataSource[@"last_time"]] ;
    //self.detailTextView.text = self.dataSource[@"desc"];
    self.saveBookModel.gid = [self.dataSource[@"gid"] integerValue];
    self.saveBookModel.nid = [self.dataSource[@"nid"] integerValue];
    [[HRDBManager sharedInstance] collectBook:self.saveBookModel];
    self.saveButton.enabled = NO;
    [self.saveButton setTitle:@"已收藏" forState:(UIControlStateNormal)];
}
- (IBAction)inBook:(id)sender {
    HRChaptersViewController *chaptersVC = [[HRChaptersViewController alloc] init];
    chaptersVC.nid = self.nid;
    chaptersVC.gid = self.gid;
    chaptersVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chaptersVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.sendTitle;
    [self fetchDataFromWeb];
  
    
}

-(void)isSave{
    
  BOOL isSave= [[HRDBManager sharedInstance] isCollectionBook:self.dataSource[@"name"]];
    NSLog(@"isSave = %d",isSave);
    if (isSave) {
        self.saveButton.enabled = NO;
        [self.saveButton setTitle:@"已收藏" forState:(UIControlStateNormal)];
    }else{
        self.saveButton.enabled =YES;
        [self.saveButton setTitle:@"收藏" forState:(UIControlStateNormal)];
    }
}



-(void)fetchDataFromWeb{
    NSString *url = [NSString stringWithFormat:HR_URL_BOOKDETAIL,self.gid];
    [[HRDataNetEngine sharedInstance] requestGetDataByUrl:url success:^(id respondObject) {
        [self parseData:respondObject];
    } falied:^(NSError *error) {
        
    }];
    
    
}
-(void)parseData:(id)respondObject{
    self.dataSource = respondObject;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:respondObject[@"img_url"]]];
    self.bookNameLabel.text = respondObject[@"topic_group_name"];
    self.authourNameLabel.text = respondObject[@"author"];
    self.dateLabel.text =[NSString stringWithFormat:@"%@",respondObject[@"last_time"]] ;
    self.detailTextView.text = respondObject[@"desc"];
    self.gid = [respondObject[@"gid"] integerValue];
    self.nid = [respondObject[@"nid"] integerValue];

    [self isSave];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
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
