//
//  HRReadViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/30.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//





#import "HRReadViewController.h"
#import "HRSettingViewController.h"

typedef NS_ENUM (NSInteger,HR_ControlType){
    HR_UP = 0,
    HR_DOWN,
    HR_MIDDLE
};

@interface HRReadViewController ()<UITextViewDelegate>
@property(nonatomic)UITextView *textView;
@property(nonatomic)UIView *controlView;
@property(nonatomic)HRSettingViewController *settingVC;
@end

@implementation HRReadViewController
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.view addSubview:self.textView];
    self.settingVC = [[HRSettingViewController alloc] initWithGid:self.gid nid:self.nid];
    [self fetchDataFromWeb];
    [self createControlPageUI];
}

-(void)fetchDataFromWeb{
    //&gid=%ld&nid=%ld&sort=%ld&gsort=0&sequence=5&chapter_name=%@
    NSDictionary *dic = @{@"gid":@(self.gid),@"nid":@(self.nid),@"sort":@(self.sort),@"chapter_name":self.chapter_name,@"gsort":@(0),@"sequence":@(5)};
  
   [[HRDataNetEngine sharedInstance] requestPostDataByUrl:HR_READER_DETAIL parameter:dic success:^(id respondObject) {
       self.textView.text = [NSString stringWithFormat:@"%@",respondObject[@"items"][0][@"content"]];
   } falied:^(NSError *error) {
       
   }];
    
}

//
-(UITextView *)textView{
    if (_textView == nil) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, HR_WIDTH_SCRENN, HR_HEIGHT_SCRENN-20)];
        _textView.delegate = self;
        _textView.backgroundColor = HR_RGB(230, 200, 180);
        _textView.font = [UIFont systemFontOfSize:23];
        _textView.editable = NO;
        _textView.directionalLockEnabled = YES;
        //_textView.pagingEnabled = YES;
    }
    return _textView;
}



#pragma mark - 创建翻页界面
-(void)createControlPageUI{
    self.controlView = [[UIView alloc] initWithFrame:self.textView.bounds];
    //self.controlView.backgroundColor =[UIColor colorWithRed:0.0 green:0.0 blue:255/255.0 alpha:0.5];
    [self.view addSubview:self.controlView];
    [self.view bringSubviewToFront:self.controlView];
    self.controlView.center = self.textView.center;
}

#pragma mark - 控制分析
/* 
 区域分析：
    左上2/3 上 1/3  向上翻页
    右下2/3 下 1/3  向上翻页
    中间1/3 呼出设置菜单
 */

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch * touch = [touches anyObject];
    CGPoint point =[touch locationInView:self.controlView];
    HR_ControlType type = [self judgementControl:point];
    [self touchesEnded:type];
}

#pragma mark - 判断点击的范围
-(HR_ControlType)judgementControl:(CGPoint)point{
    CGFloat xTouch = 0.0;
    CGFloat yTouch = 0.0;
    xTouch = point.x;
    yTouch = point.y;
    if ((xTouch >=0 && xTouch <= HR_WIDTH_SCRENN && yTouch <= HR_HEIGHT_SCRENN/3 && yTouch>= 0)||(xTouch >= 0 && xTouch <= HR_WIDTH_SCRENN/3 && yTouch>= 0 && yTouch<=HR_HEIGHT_SCRENN*2/3)){
        NSLog(@"UP");
        return HR_UP;
    }else if((xTouch >=0 && xTouch <= HR_WIDTH_SCRENN && yTouch <= HR_HEIGHT_SCRENN && yTouch>= HR_HEIGHT_SCRENN*2/3)||(xTouch >= HR_WIDTH_SCRENN*2/3 && xTouch <= HR_WIDTH_SCRENN && yTouch>= HR_HEIGHT_SCRENN/3 && yTouch<=HR_HEIGHT_SCRENN)){
        NSLog(@"DOWN");
        return HR_DOWN;
    }else{
        NSLog(@"MIDDLE");
        return HR_MIDDLE;
    }
}

#pragma mark - 根据点击的范围调用不同的方法
-(void)touchesEnded:(HR_ControlType)controlType{
    if ([self judgementIsExsiest]) {
        return;
    }
    
    switch (controlType) {
        case HR_UP:{

            
            if (self.textView.contentOffset.y >= HR_HEIGHT_SCRENN-20) {
                self.textView.contentOffset = CGPointMake(self.textView.contentOffset.x, self.textView.contentOffset.y-HR_HEIGHT_SCRENN);
            }
            
            break;}
        case HR_DOWN:{
            if (self.textView.contentSize.height - self.textView.contentOffset.y >= HR_HEIGHT_SCRENN) {
                self.textView.contentOffset = CGPointMake(self.textView.contentOffset.x, self.textView.contentOffset.y+HR_HEIGHT_SCRENN);
            }
            
            break;}
        case HR_MIDDLE:{
            [self createSettingView];
            break;}
            
        default:
            break;
    }
}

#pragma mark - 创建settingView
-(void)createSettingView{
    UIView * view = self.settingVC.view;
    if (view.frame.origin.y >= HR_HEIGHT_SCRENN) {
        view.frame = CGRectMake(0, HR_HEIGHT_SCRENN, HR_WIDTH_SCRENN, 70);
        [self.view addSubview:view];
        [self.view bringSubviewToFront:view];
        [UIView animateWithDuration:0.5 animations:^{
            view.frame = CGRectMake(0, HR_HEIGHT_SCRENN-70, HR_WIDTH_SCRENN, 70);
            
        }];
    }
}


-(BOOL)judgementIsExsiest{

    if (self.settingVC.view.frame.origin.y < HR_HEIGHT_SCRENN) {
        [UIView animateWithDuration:0.5 animations:^{
            self.settingVC.view.frame = CGRectMake(0, HR_HEIGHT_SCRENN, HR_WIDTH_SCRENN, 70);
        }];
        return YES;
    }
    return NO;
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
