//
//  HRCartoonReadViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/4/4.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCartoonReadViewController.h"

@interface HRCartoonReadViewController ()

@end

@implementation HRCartoonReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchNetData];
}

-(void)fetchNetData{
    NSString *url = [NSString stringWithFormat:HR_URL_CARTOON_DETAL_PIC,self.chapter_id];
[[HRDataNetEngine sharedInstance] requestGetDataByUrl:url success:^(id respondObject) {
     NSLog(@"%@",url);
    NSLog(@"%@",respondObject);
} falied:^(NSError *error) {
    
}];


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
