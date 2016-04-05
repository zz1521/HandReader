//
//  HRScrollViewModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRScrollViewModel.h"

@implementation HRScrollViewModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{};

+(NSMutableArray *)parseData:(NSArray *)array{
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        HRScrollViewModel *model = [[HRScrollViewModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [mArray addObject:model];
    }
    return mArray;
}

@end
