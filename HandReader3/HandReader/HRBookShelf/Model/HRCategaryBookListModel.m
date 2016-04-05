//
//  HRCategaryBookListModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCategaryBookListModel.h"

@implementation HRCategaryBookListModel

+(NSMutableArray *)parseData:(id)respondObject{
    NSMutableArray *resultArr = [NSMutableArray array];
    
    for (NSDictionary *dic in respondObject[@"items"]) {
        HRCategaryBookListModel *model = [[HRCategaryBookListModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [resultArr addObject:model];
    }
    return resultArr;

}

@end
