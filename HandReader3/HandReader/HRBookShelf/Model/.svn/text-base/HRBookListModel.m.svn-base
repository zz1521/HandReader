//
//  HRBookListModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/29.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRBookListModel.h"

@implementation HRBookListModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
+(NSMutableArray *)parseData:(id)respondObject{
    NSMutableArray *resultArr = [NSMutableArray array];
    
    for (NSDictionary *dic in respondObject[@"item"]) {
        HRBookListModel *model = [[HRBookListModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [resultArr addObject:model];
    }
    return resultArr;
}
@end
