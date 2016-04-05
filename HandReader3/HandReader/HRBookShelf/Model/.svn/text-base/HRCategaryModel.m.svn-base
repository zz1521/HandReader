//
//  HRCategaryModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/29.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCategaryModel.h"

@implementation HRCategaryModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

+(NSMutableArray *)parseData:(id)respondObject{
    NSMutableArray *resultArr = [NSMutableArray array];
    for (NSDictionary *dic in respondObject[@"items"]) {
        HRCategaryModel *model = [[HRCategaryModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [resultArr addObject:model];
    }
    return resultArr;
}

@end
