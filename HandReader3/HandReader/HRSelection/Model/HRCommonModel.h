//
//  HRCommonModel.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/31.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRCommonModel : NSObject

@property (nonatomic, copy) NSString *AuthorName;

@property (nonatomic, assign) NSInteger RecommenId;

@property (nonatomic, assign) NSInteger IsVip;

@property (nonatomic, assign) NSInteger ImageStatus;

@property (nonatomic, assign) NSInteger BssRecomTotal;

@property (nonatomic, copy) NSString *CategoryName;

@property (nonatomic, assign) NSInteger EnableBookUnitLease;

@property (nonatomic, assign) NSInteger AuthorId;

@property (nonatomic, copy) NSString *BookStatus;

@property (nonatomic, assign) NSInteger WholeSale;

@property (nonatomic, copy) NSString *Recommendation;

@property (nonatomic, assign) NSInteger BookId;

@property (nonatomic, assign) NSInteger WordsCount;

@property (nonatomic, copy) NSString *LastUpdateChapterName;

@property (nonatomic, copy) NSString *AlgInfo;

@property (nonatomic, copy) NSString *Label;

@property (nonatomic, assign) NSInteger IsQin;

@property (nonatomic, copy) NSString *NewPrice;

@property (nonatomic, copy) NSString *BookName;

@property (nonatomic, assign) NSInteger CategoryId;

@property (nonatomic, copy) NSString *Description;

@property (nonatomic, copy) NSString *Author;

@property (nonatomic, assign) NSInteger LastVipUpdateChapterId;

@property (nonatomic, copy) NSString *LastVipUpdateChapterName;

@property (nonatomic, assign) long long LastVipChapterUpdateTime;

@property (nonatomic, assign) NSInteger LastUpdateChapterID;

@property (nonatomic, assign) NSInteger EnableBookUnitBuy;

@property (nonatomic, assign) long long LastChapterUpdateTime;

@property (nonatomic, copy) NSString *Price;

@property (nonatomic, assign) NSInteger BssReadTotal;

@property (nonatomic, assign) NSInteger ReadingType;
+(NSMutableArray *)parseData:(NSArray *)array;
@end
