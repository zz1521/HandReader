//
//  HRTabBarController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/28.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import "HRTabBarController.h"

@interface HRTabBarController ()

@end

@implementation HRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createFourViewController];
}

-(void)createFourViewController{
    NSMutableArray *viewControllers = [NSMutableArray array];
    for (NSInteger index = 0; index < 4; index++) {
        UIViewController *viewController = [[NSClassFromString(HR_CLASS_ARRAY[index]) alloc] init];
        UINavigationController *LPFNav = [[UINavigationController alloc] initWithRootViewController:viewController];
        NSString *imageName = [NSString stringWithFormat:@"tabbar_btn%ld_normal",index+1];
        LPFNav.tabBarItem.image = [UIImage imageNamed:imageName];
        NSString *selectImageName = [NSString stringWithFormat:@"tabbar_btn%ld_select",index+1];
        LPFNav.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
        //LPFNav.navigationBar.translucent =YES;
        [viewControllers addObject:LPFNav];
    }
    [self createLaunchScreenImageAmination];
    self.viewControllers = viewControllers;
}

-(void)createLaunchScreenImageAmination{
    UIImageView * starImage = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    starImage.image = [UIImage imageNamed:@"WELCOME"];
    [self.view addSubview:starImage];
    [UIView animateWithDuration:3 animations:^{
        starImage.alpha = 0;
    } completion:^(BOOL finished) {
        [starImage removeFromSuperview];
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
