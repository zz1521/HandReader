//
//  HRBookShelfModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/28.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import "HRBookShelfModel.h"

@implementation HRBookShelfModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}


+(NSMutableArray *)parseData:(id)respondObject{
    
    NSMutableArray *resultArr = [NSMutableArray array];
    
    for (NSDictionary *dic in respondObject[@"item"]) {
        HRBookShelfModel *model = [[HRBookShelfModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [resultArr addObject:model];
    }
    return resultArr;
}

@end
