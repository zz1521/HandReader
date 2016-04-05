//
//  HRCategaryBookListModel.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRCategaryBookListModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, assign) NSInteger chapterCount;

@property (nonatomic, copy) NSString *site;

@property (nonatomic, assign) NSInteger chargeGid;

@property (nonatomic, assign) NSInteger subscribeCount;

@property (nonatomic, assign) long long lastTime;

@property (nonatomic, assign) NSInteger siteCount;

@property (nonatomic, assign) NSInteger topicGroupId;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *classes;

@property (nonatomic, copy) NSString *sourceId;

@property (nonatomic, copy) NSString *lastChapterName;

@property (nonatomic, assign) NSInteger topicNum;

@property (nonatomic, assign) NSInteger nid;

@property (nonatomic, copy) NSString *cpId;

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, assign) NSInteger gid;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger charge;

@property (nonatomic, copy) NSString *author;
+(NSMutableArray *)parseData:(id)respondObject;
@end
