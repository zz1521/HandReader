//
//  HRAboutMeViewController.m
//  HandReader
//
//  Created by qianfeng on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRAboutMeViewController.h"

@interface HRAboutMeViewController ()

@end

@implementation HRAboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = NO;
    self.title = @"关于我们";
    [self createUI];
}
-(void)createUI{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = [UIImage imageNamed:@"WELCOME"];
    [self.view addSubview:imageView];
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, HR_WIDTH_SCRENN * 3 /4, 200);
    label.center = imageView.center;
    label.text = @"We don't write a book, we just literary porter; for to let you enjoy a good book and appreciate Chinese culture is broad and profound, yay! You're welcome!";
    label.font = [UIFont fontWithName:@"Georgia-Bold" size:20];
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;//自适应宽度
    label.numberOfLines = 0;//行数
    [imageView addSubview:label];
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
