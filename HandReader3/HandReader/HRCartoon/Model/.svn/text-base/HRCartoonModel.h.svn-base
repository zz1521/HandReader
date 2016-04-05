//
//  HRCartoonModel.h
//  HandReader
//
//  Created by qianfeng on 16/4/1.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "JSONModel.h"

@interface HRCartoonModel : JSONModel
//漫画列表界面model
@property (nonatomic, strong)NSString * name;
@property (nonatomic, strong)NSString * cover;//图片
@property (nonatomic, strong)NSString * last_update_chapter_name;//要显示的简介的出处
@property (nonatomic, strong)NSString<Optional> * hr_description;//简介书中的几句话
@property (nonatomic, strong)NSString * nickname;//作者
@property (nonatomic, strong)NSString * extraValue;

@property (nonatomic, strong)NSArray * tags;//类型

@property (nonatomic)NSInteger comic_id;//传递给漫画简介界面

+(NSMutableArray *)parseData:(id)respondObject;

@end
