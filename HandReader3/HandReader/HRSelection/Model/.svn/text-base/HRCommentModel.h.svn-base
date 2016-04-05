//
//  HRCommentModel.h
//  HandReader
//
//  Created by qianfeng0 on 16/4/1.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRCommentModel : NSObject
/*{
    "RankName": "见习",
    "Id": 265233950,
    "ViewCount": 1,
    "PostCount": 0,
    "Subject": "0.0",
    "UserName": "发飙的大象CC",
    "UserId": 215789716,
    "PostDate": 1459421689000,
    "Body": "0.0",
    "Type": 110,
    "VoteYes": 0,
    "VoteAgainst": 0,
    "UserHeadIcon": "http://me.qidian.com/Images/UserImages/100x100/120.jpg",
    "From": "Android端"
}*/
@property (nonatomic, copy) NSString *Subject;

@property (nonatomic, assign) NSInteger VoteAgainst;

@property (nonatomic, assign) NSInteger Id;

@property (nonatomic, assign) long long PostDate;

@property (nonatomic, copy) NSString *RankName;

@property (nonatomic, assign) NSInteger UserId;

@property (nonatomic, copy) NSString *UserName;

@property (nonatomic, copy) NSString *Body;

@property (nonatomic, assign) NSInteger VoteYes;

@property (nonatomic, assign) NSInteger PostCount;

@property (nonatomic, copy) NSString *From;

@property (nonatomic, assign) NSInteger Type;

@property (nonatomic, copy) NSString *UserHeadIcon;

@property (nonatomic, assign) NSInteger ViewCount;
+(NSMutableArray *)parseData:(id)respondObject;
@end
