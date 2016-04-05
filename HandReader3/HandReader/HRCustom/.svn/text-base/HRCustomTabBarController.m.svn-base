//
//  HRCustomTabBarController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/23.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import "HRCustomTabBarController.h"
#import "HRTabBarButton.h"
@interface HRCustomTabBarController ()
@property (nonatomic,assign)BOOL  firstLoad;

@property (nonatomic,retain)UIView  * customizedTabBar;
@end

@implementation HRCustomTabBarController


- (void)dealloc
{
    self.customizedTabBar = nil;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(_firstLoad){
        //只能写到这个方法里,要不self.viewControllers为空
        NSArray * tabBarBtns=self.tabBar.subviews;
        for (UIView * tabBarBtn in tabBarBtns) {
            tabBarBtn.hidden=YES;
        }
        
        CGFloat itemWidth=self.view.bounds.size.width/self.viewControllers.count;
        
        for (int i=0; i<self.viewControllers.count; i++) {
            UIViewController * vc=[self.viewControllers objectAtIndex:i];
            HRTabBarButton * BarBtn=[[HRTabBarButton alloc] initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth, 50)
                                                              unselectedImage:vc.tabBarItem.image selectedImage:vc.tabBarItem.selectedImage title:vc.tabBarItem.title];
            BarBtn.tag=100+i;
            
            [BarBtn setClickEventTarget:self action:@selector(tabBtnClick:)];
            [self.tabBar addSubview:BarBtn];
        }
        HRTabBarButton * selecedBtn=(HRTabBarButton *)[self.tabBar viewWithTag:self.selectedIndex+100];
        selecedBtn.selected=YES;
        
        _firstLoad = NO;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _firstLoad=YES;
}

- (void)tabBtnClick:(HRTabBarButton *)btn
{
    // tabbar按钮点击的时候需要切换视图
    HRTabBarButton *currentSelectedBtn = (HRTabBarButton *)[self.tabBar viewWithTag:(self.selectedIndex + 100)];
    
    if (currentSelectedBtn != btn) {
        
        currentSelectedBtn.selected = NO;
        btn.selected = YES;
        
        self.selectedIndex = btn.tag - 100;
    }
}


- (BOOL)shouldAutorotate
{
    return NO;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
