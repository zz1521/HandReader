//
//  HRCartoonChapterListModel.h
//  HandReader
//
//  Created by qianfeng0 on 16/4/4.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "JSONModel.h"

@interface HRCartoonChapterListModel : JSONModel
@property (nonatomic, copy) NSString *image_total;

@property (nonatomic, copy) NSString *buyed;

@property (nonatomic, copy) NSString *pass_time;

//@property (nonatomic, assign) NSInteger is_free;

@property (nonatomic, copy) NSString *release_time;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *size;

@property (nonatomic, copy) NSString *chapter_id;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, assign) NSInteger is_view;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger read_state;
+(NSMutableArray *)parseData:(id)respondObject;
@end
