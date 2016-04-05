//
//  HRSweepViewController.m
//  HandReader
//
//  Created by qianfeng on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRSweepViewController.h"

@interface HRSweepViewController ()

@end

@implementation HRSweepViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"扫一扫";
    [self createUI];
}
-(void)createUI{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"MenuBackground"];
    [self.view addSubview:imageView];
    UIImageView * sweep = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    sweep.center = imageView.center;
    sweep.image = [UIImage imageNamed:@"swee2"];
    [imageView addSubview:sweep];
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
