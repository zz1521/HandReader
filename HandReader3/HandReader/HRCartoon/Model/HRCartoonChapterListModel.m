//
//  HRCartoonChapterListModel.m
//  HandReader
//
//  Created by qianfeng0 on 16/4/4.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRCartoonChapterListModel.h"

@implementation HRCartoonChapterListModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}
+(NSMutableArray *)parseData:(id)respondObject{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (NSDictionary *dic in respondObject) {
        HRCartoonChapterListModel *model = [[HRCartoonChapterListModel alloc] initWithDictionary:dic error:nil];
        if (model) {
           [resultArray addObject:model];
        }
        
    }
    return resultArray;
}
@end
