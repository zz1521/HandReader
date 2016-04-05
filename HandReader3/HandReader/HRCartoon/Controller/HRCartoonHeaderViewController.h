//
//  HRCartoonHeaderViewController.h
//  HandReader
//
//  Created by qianfeng0 on 16/4/4.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRCartoonComicModel.h"
@interface HRCartoonHeaderViewController : UIViewController
@property(nonatomic)HRCartoonComicModel *comicModel;

-(instancetype)initWithModel:(HRCartoonComicModel *)model;
@end
