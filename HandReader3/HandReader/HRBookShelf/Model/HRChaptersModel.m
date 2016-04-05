//
//  HRChaptersModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/30.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRChaptersModel.h"

@implementation HRChaptersModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
+(NSMutableArray *)parseData:(id)respondObject{
    NSMutableArray *resultArr = [NSMutableArray array];
    
    for (NSDictionary *dic in respondObject[@"items"]) {
        HRChaptersModel *model = [[HRChaptersModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [resultArr addObject:model];
    }
    return resultArr;
}

@end
