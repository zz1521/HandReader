//
//  LPFUserViewController.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/28.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import "HRUserViewController.h"
#import "HRAboutMeViewController.h"
#import "HRTouchMeViewController.h"
#import "HRSweepViewController.h"
#import "HRMyCollectViewController.h"
#import "SDImageCache.h"

const CGFloat BackGroupHeight = 200;
const CGFloat HeadImageHeight= 80;

@interface HRUserViewController ()<UITableViewDataSource,
                                    UITableViewDelegate,
                                    UIScrollViewDelegate,
                                    UIActionSheetDelegate>
{
    NSArray * dateArray;
    NSArray * imageArray;
    UIImageView *_imageBG;
    UIView *_BGView;
    UIImageView *_headImageView;//头像
}
@property(nonatomic, strong)UITableView * HRTableView;
@end

@implementation HRUserViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
//    self.navigationController.navigationBarHidden = YES;//隐藏
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";//导航条加标题
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];//导航条透明
    [self createUI];
}
-(void)createUI{
    UIImage * image = [UIImage imageNamed:@"backgroud"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    imageArray = @[@"",@"aboutme",@"touchme",@"sss",@"sweep",@"collect"];
    dateArray = @[@"",@"关于我们",@"联系我们",@"扫一扫",@"清除缓存",@"我的收藏"];
    [self.view addSubview:self.HRTableView];
    //下拉后显示的图片
    _imageBG = [[UIImageView alloc]initWithFrame:CGRectMake(0, -BackGroupHeight, HR_WIDTH_SCRENN, BackGroupHeight)];
    _imageBG.image = [UIImage imageNamed:@"star"];
    [self.HRTableView addSubview:_imageBG];
    //透明的view 盖住_imageBG
    _BGView = [[UIView alloc]initWithFrame:CGRectMake(0, -BackGroupHeight, HR_WIDTH_SCRENN, BackGroupHeight)];
    _BGView.backgroundColor = [UIColor clearColor];
    [self.HRTableView addSubview:_BGView];
    //头像
    _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(HR_WIDTH_SCRENN / 2, 20, 100, 100)];
//    NSArray * imageName = @[@"head",@"head2"];//用于更换头像  暂时不用
    _headImageView.image = [UIImage imageNamed:@"head"];
    //切圆
    _headImageView.layer.masksToBounds = YES;//
    _headImageView.layer.cornerRadius = 50;
    //中心点位置
    _headImageView.center = CGPointMake(HR_WIDTH_SCRENN / 2, 100);
    //用户交互
    _headImageView.userInteractionEnabled = YES;
    //添加手势
    UITapGestureRecognizer * Tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    [_headImageView addGestureRecognizer:Tap];
    [_BGView addSubview:_headImageView];
}
#pragma  mark -- 动画scrollView的代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + BackGroupHeight) / 2;
    if (yOffset < -BackGroupHeight) {
        CGRect rect = _imageBG.frame;
        rect.origin.y    = yOffset;
        rect.origin.x    = xOffset;
        rect.size.height = -yOffset;
        rect.size.width  = HR_WIDTH_SCRENN + fabs(xOffset) * 2;
        _imageBG.frame = rect;
    }
    CGFloat alpha = (yOffset + BackGroupHeight)/BackGroupHeight;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor colorWithRed:0.7f green:0.26f blue:0.31F alpha:1.0f]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    alpha = fabs(alpha);
    alpha = fabs(1-alpha);
    alpha = alpha < 0.5 ? 0 : alpha;
    _BGView.alpha = alpha;
}
- (UIImage *)imageWithColor:(UIColor *)color{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return theImage;
}
#pragma mark -- tablView
//懒加载
- (UITableView*)HRTableView{
    if (!_HRTableView) {
        _HRTableView = [[UITableView alloc]initWithFrame:self.view.frame];
        _HRTableView.contentInset = UIEdgeInsetsMake(BackGroupHeight, 0, 0, 0);
        _HRTableView.delegate = self;
        _HRTableView.dataSource = self;
        self.HRTableView.separatorStyle = UITableViewCellSeparatorStyleNone;//取消所有横线
        self.HRTableView.showsVerticalScrollIndicator = NO;//不显示滚动条
        _HRTableView.backgroundColor = [UIColor clearColor];
////******************************************设置tableView移动的偏移量 与导航条隐藏的关系
//        if([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]){
//            
//            self.automaticallyAdjustsScrollViewInsets = NO;
//            
//            UIEdgeInsets insets = self.HRTableView.contentInset;
//            
//            insets.top =self.navigationController.navigationBar.bounds.size.height;
//            
//            self.HRTableView.contentInset =insets;
//            
//            self.HRTableView.scrollIndicatorInsets = insets;
//        }
//        self.HRTableView.frame =CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height);
//        
////*********************************
    }
    return _HRTableView;
}


#pragma mark =====
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = dateArray[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//选中时无色
    cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
    if (indexPath.row == 4) {
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }else if (indexPath.row == 0) {
        cell.accessoryType = UITableViewCellAccessoryNone ;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator ;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
            
        case 0:{
            HRAboutMeViewController * vc = [[HRAboutMeViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            //关于我们
            break;
        case 1:{
            HRTouchMeViewController * vc = [[HRTouchMeViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            //联系我们
            break;
        case 2:{
            HRSweepViewController * vc = [[HRSweepViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            //扫一扫
            break;
        case 3:{
            //弹出清除缓存提示
            UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:[NSString stringWithFormat:@"清除缓存:%.2f Kb",[self getCachesSize]] delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles:nil];
            [actionSheet  showInView:self.view];
        }
            //清除缓存
            break;
        case 4:{
            //收藏
            HRMyCollectViewController * vc = [[HRMyCollectViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
    }
}
-(double)getCachesSize{
    NSUInteger sdFileSize = [[SDImageCache sharedImageCache]getSize];
    NSString * cacher = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
    NSString * myCachesPath = [cacher stringByAppendingString:@"myCaches"];
    NSDirectoryEnumerator * enumerator = [[NSFileManager defaultManager]enumeratorAtPath:myCachesPath];
    NSUInteger mySize = 0;
    for (NSString * fileName in enumerator) {
        NSString * filePath = [myCachesPath stringByAppendingString:fileName];
        NSDictionary * fileDic = [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil];
        mySize += fileDic.fileSize;
    }
    return (sdFileSize + mySize)/ 1024.0 ;
}
//调用此方法 清楚缓存文件中的内容
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == actionSheet.destructiveButtonIndex) {
        [[SDImageCache sharedImageCache]clearMemory];//qing
        [[SDImageCache sharedImageCache]clearDisk];
        NSString * caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        NSString * mycachesPath = [caches stringByAppendingPathComponent:@"myCaches"];
        [[NSFileManager defaultManager]removeItemAtPath:mycachesPath error:nil];
    }
}
//tableview滑动的时候隐藏导航条
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    
//    if(velocity.y > 0){
//        self.navigationController.navigationBar.hidden = NO;
//    }else{
//        self.navigationController.navigationBar.hidden = YES;
//    }
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end










