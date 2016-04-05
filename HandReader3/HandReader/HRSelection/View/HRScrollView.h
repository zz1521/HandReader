//
//  HRScrollView.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HRScrollView : UIView
@property(nonatomic)NSTimer        *timer;
@property(nonatomic)UIScrollView   *hr_scrollView;
@property(nonatomic)NSMutableArray *hr_ImageArray;
+(instancetype)circleViewFrame:(CGRect)frame;
@end
