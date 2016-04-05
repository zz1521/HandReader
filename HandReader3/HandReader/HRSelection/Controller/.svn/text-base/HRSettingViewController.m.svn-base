//
//  HRSettingViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/4/3.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRSettingViewController.h"
#import "HRChaptersViewController.h"
@interface HRSettingViewController ()

@end

@implementation HRSettingViewController

-(id)initWithGid:(NSInteger)gid nid:(NSInteger)nid{
    if ([super init]) {
        self.gid = gid;
        self.nid = nid;
    }
    return self;
}

- (IBAction)backBookShlef:(id)sender {
    UIResponder *object = self.nextResponder;
    while (object != nil && ![object isKindOfClass:[UIViewController class]]) {
        object = object.nextResponder;
    }
    UIViewController *viewController = (UIViewController*)object;
    [viewController.navigationController popToRootViewControllerAnimated:YES];
    
}


- (IBAction)contentsButton:(id)sender {
    HRChaptersViewController *chaptersVC =[[HRChaptersViewController alloc] init];
    chaptersVC.gid = self.gid;
    chaptersVC.nid = self.nid;
    //找到UIViewController ，使用事件响应链
    UIResponder *object = self.nextResponder;
    while (object != nil && ![object isKindOfClass:[UIViewController class]]) {
        object = object.nextResponder;
    }
    UIViewController *viewController = (UIViewController*)object;
    [viewController.navigationController pushViewController:chaptersVC animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
