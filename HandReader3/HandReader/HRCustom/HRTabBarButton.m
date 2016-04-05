//
//  HRTabBarButton.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/23.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//
#import "HRTabBarButton.h"

/**
这是一个消除performSelector警告的宏
*/
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)



@implementation HRTabBarButton

- (void)dealloc
{
self.unselectedImg = nil;
self.selectedImg = nil;
self.target = nil;
self.action = nil;
}

- (id)initWithFrame:(CGRect)frame unselectedImage:(UIImage *)unselectedImg selectedImage:(UIImage *)selectedImg title:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        
        self.selectedImg = selectedImg;
        self.unselectedImg = unselectedImg;
        
        // icon图标
        UIImageView *imageView = [[UIImageView alloc] initWithImage:unselectedImg];
        imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        imageView.tag = 1001;
        [self addSubview:imageView];
        
        // 标题
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.bounds.size.width, 20)];
        label.text = title;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 1002;
        [self addSubview:label];
        
        // 点击事件
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandle:)];
        [imageView addGestureRecognizer:tapGesture];
        imageView.userInteractionEnabled = YES;
    }
    
    return self;
}

// 选中状态改变的时候你icon和文字颜色需要改变
- (void)setSelected:(BOOL)selected
{
    if (_selected != selected) {
        _selected = selected;
        
        UIImageView *imageView = (UIImageView *)[self viewWithTag:1001];
        UILabel *label = (UILabel *)[self viewWithTag:1002];
        
        if (selected) {
            
            imageView.image = self.selectedImg;
            label.textColor = [UIColor colorWithRed:254/255.0f green:120/255.0f blue:20/255.0f alpha:1.0f];
        }
        else {
            
            imageView.image = self.unselectedImg;
            label.textColor = [UIColor whiteColor];
        }
    }
}


- (void)setClickEventTarget:(id)target action:(SEL)action
{
    // 保存目标和方法
    self.target = target;
    self.action =  action;
}


- (void)tapHandle:(id)sender
{
    // 在适当的时候，调用事件的方法
    // 防Xcode6的内存警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self.target performSelector:self.action withObject:self];
#pragma clang diagnostic pop
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
