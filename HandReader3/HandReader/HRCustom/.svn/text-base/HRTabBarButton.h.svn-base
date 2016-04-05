//
//  HRTabBarButton.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/23.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 这个是自定义的TabBar上的按钮，可以定义选中图片，非选中的图片，和标题
 */
@interface HRTabBarButton : UIView
@property (nonatomic, retain)   UIImage *unselectedImg;
@property (nonatomic, retain)   UIImage *selectedImg;
@property (nonatomic, assign)   id      target;
@property (nonatomic, assign)   SEL     action;

@property (nonatomic, assign)   BOOL    selected;


/**
 按钮的初始化方法
 */
- (id)initWithFrame:(CGRect)frame unselectedImage:(UIImage *)unselectedImg selectedImage:(UIImage *)selectedImg title:(NSString *)title;

/**
 给按钮添加点击事件
 */
- (void)setClickEventTarget:(id)target action:(SEL)action;
@end

