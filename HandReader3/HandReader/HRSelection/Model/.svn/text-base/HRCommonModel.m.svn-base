//
//  HRCommonModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCommonModel.h"

@implementation HRCommonModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{};
+(NSMutableArray *)parseData:(NSArray *)array{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSDictionary *dict in dic[@"Data"]) {
            HRCommonModel *model = [[HRCommonModel alloc] init];
            [model setValuesForKeysWithDictionary:dict];
            [mArray addObject:model];
        }
        [resultArray addObject:mArray];
        //注意此处可变数组一定要清空
        //[mArray removeAllObjects];
    }
    return resultArray;
}
@end
