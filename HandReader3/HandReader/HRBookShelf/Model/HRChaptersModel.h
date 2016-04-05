//
//  HRChaptersModel.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/30.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRChaptersModel : NSObject

@property (nonatomic, copy) NSString *site;

@property (nonatomic, assign) NSInteger sort;

@property (nonatomic, assign) long long time;

@property (nonatomic, assign) NSInteger gsort;

@property (nonatomic, copy) NSString *curl;

@property (nonatomic, assign) NSInteger accelerate;

@property (nonatomic, assign) NSInteger nid;
@property (nonatomic, assign) NSInteger gid;
@property (nonatomic, copy) NSString *chapter_name;

@property (nonatomic, assign) NSInteger paid;

@property (nonatomic, assign) NSInteger charge;

@property (nonatomic, copy) NSString *ctype;

+(NSMutableArray *)parseData:(id)respondObject;

@end
