//
//  HRCartoonModel.m
//  HandReader
//
//  Created by qianfeng on 16/4/1.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCartoonModel.h"

@implementation HRCartoonModel

+(JSONKeyMapper*)keyMapper{

    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description":@"hr_description"}];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
+(NSMutableArray *)parseData:(id)respondObject{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (NSDictionary *dic in respondObject[@"data"][@"returnData"]) {
        HRCartoonModel *model = [[HRCartoonModel alloc] initWithDictionary:dic error:nil];
        [resultArray addObject:model];
    }
    return resultArray;
}



@end
