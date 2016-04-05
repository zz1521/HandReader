//
//  HRDBManager.h
//  HandReader
//
//  Created by qianfeng0 on 16/4/2.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HRSaveBookModel.h"
#import "HRChaptersModel.h"
@interface HRDBManager : NSObject
+ (instancetype)sharedInstance;

- (void)collectBook:(HRSaveBookModel*)bookModel;
- (void)deleteCollectBook:(HRSaveBookModel*)bookModel;
- (void)updateCollectBook:(HRChaptersModel*)bookModel;
- (NSArray*)allCollectBook;
-(BOOL)isCollectionBook:(NSString *)bookName;
@end
