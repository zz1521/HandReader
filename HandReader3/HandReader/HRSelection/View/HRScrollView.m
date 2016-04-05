//
//  HRScrollView.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRScrollView.h"
#import "UIImageView+WebCache.h"
#import "UIImage+SDImageCacheExtension.h"

#import "HRScrollViewModel.h"
@implementation HRScrollView
+(instancetype)circleViewFrame:(CGRect)frame{
    HRScrollView *view = [[HRScrollView alloc] initWithFrame:frame];
    view.hr_scrollView= [[UIScrollView alloc] initWithFrame:frame];
    [view addSubview:view.hr_scrollView];
    view.timer = [NSTimer scheduledTimerWithTimeInterval:5 target:view selector:@selector(scrollbana) userInfo:nil repeats:YES];
    [view.timer setFireDate:[NSDate distantFuture]];
    return view;
}

-(void)setHr_ImageArray:(NSMutableArray *)hr_ImageArray{

    _hr_ImageArray = hr_ImageArray;
    _hr_scrollView.pagingEnabled = YES;
    _hr_scrollView.contentSize = CGSizeMake(HR_WIDTH_SCRENN *_hr_ImageArray.count, 80);
    for (NSInteger i = 0; i < _hr_ImageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.bounds) *i, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        HRScrollViewModel *model = _hr_ImageArray[i];
        imageView.image = [UIImage cachedImageWithURL:model.Pic];
        if (!imageView.image) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.Pic]];
        }
        [self.hr_scrollView addSubview:imageView];
    }
    [self openTimer];

}

-(void)openTimer{
    [self.timer setFireDate:[NSDate distantPast]];
}

-(void)scrollbana{
    if (self.hr_scrollView.contentOffset.x>= self.hr_scrollView.frame.size.width *(self.hr_ImageArray.count-1)) {
        self.hr_scrollView.contentOffset = CGPointZero;
    }else{
        self.hr_scrollView.contentOffset = CGPointMake(self.hr_scrollView.contentOffset.x+self.hr_scrollView.frame.size.width, 0);
    }
}

@end
