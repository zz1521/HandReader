//
//  HRDataNetEngine.m
//  HandReader
//
//  Created by qianfeng0 on 16/3/26.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#import "HRDataNetEngine.h"
#import "AFNetworking.h"

@implementation HRDataNetEngine

+(instancetype)sharedInstance{
    static HRDataNetEngine *hrNetEngine = nil;
    static dispatch_once_t hrOnce;
dispatch_once(&hrOnce, ^{
    hrNetEngine = [[HRDataNetEngine alloc]init];
});
    return hrNetEngine;
}

//get 方式请求数据
- (void)requestGetDataByUrl:(NSString*)url success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock{
    NSString *encodeUrl = [self encodeUrl:url];
  AFHTTPRequestOperationManager *manager = [self returnManager];
    [manager GET:encodeUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
    }];
    
    
}

-(NSString *)encodeUrl:(NSString *)url{

    return [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];

}


//post 方式请求数据
- (void)requestPostDataByUrl:(NSString*)url parameter:(id)parameter success:(SuccessBlockType)successBlock falied:(FailedBlockType)failedBlock{
  AFHTTPRequestOperationManager *manager = [self returnManager];
    NSString *encodeUrl = [self encodeUrl:url];
    [manager POST:encodeUrl parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failedBlock) {
            failedBlock(error);
        }
    }];
    
    
}

//创建AFHTTPRequestOperationManager
-(AFHTTPRequestOperationManager *)returnManager{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSSet *set = manager.responseSerializer.acceptableContentTypes;
    NSMutableSet *acceptSet = [NSMutableSet setWithSet:set];
    [acceptSet addObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = acceptSet;
    return manager;
}






@end
