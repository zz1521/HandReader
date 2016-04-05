//
//  HRDataNetEngine.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/26.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//



#import <Foundation/Foundation.h>

typedef void(^SuccessBlockType)(id respondObject);
typedef void(^FailedBlockType) (NSError *error);

@interface HRDataNetEngine : NSObject
+(instancetype)sharedInstance;

- (void)requestGetDataByUrl:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock;
- (void)requestPostDataByUrl:(NSString*)url parameter:(id)parameter success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock;

@end
