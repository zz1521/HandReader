//
//  HRBookDetialModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRBookDetialModel.h"

@implementation HRBookDetialModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{};

+(NSMutableArray *)parseData:(id)respondObject{
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    HRBookDetialModel *model = [[HRBookDetialModel alloc] init];
    
    [model setValuesForKeysWithDictionary:respondObject[@"Data"]];
    
    [resultArray addObject:model];
    
    return resultArray;

}
@end
