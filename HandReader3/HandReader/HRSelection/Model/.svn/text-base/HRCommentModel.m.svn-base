//
//  HRCommentModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/4/1.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCommentModel.h"

@implementation HRCommentModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
+(NSMutableArray *)parseData:(id)respondObject{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (NSDictionary *dic in respondObject) {
        HRCommentModel *model = [[HRCommentModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [resultArray addObject:model];
    }
    
    return  resultArray;
}
@end
