//
//  HRBookListModel.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/29.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRBookListModel : NSObject
//{
//    author = "[\U65e5]\U9ed1\U67f3\U5f7b\U5b50";
//    "book_name" = "\U7a97\U8fb9\U7684\U5c0f\U8c46\U8c46";
//    category = "\U5176\U4ed6";
//    coverImgUrl = "http://image.book.easou.com/i/default/cover.jpg";
//    gid = 43658;
//    "last_sort" = 16;
//    "last_time" = 1419924715000;
//    "lastchapter_name" = "\U7b2c\U5341\U516d\U7ae0";
//    nid = 11601803;
//    status = "\U5b8c\U672c";
//    subscribeCount = 497354;
//}


@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) NSInteger last_sort;

@property (nonatomic, assign) long long last_time;

@property (nonatomic, copy) NSString *coverImgUrl;

@property (nonatomic, assign) NSInteger nid;

@property (nonatomic, copy) NSString *lastchapter_name;

@property (nonatomic, assign) NSInteger subscribeCount;

@property (nonatomic, assign) NSInteger gid;

@property (nonatomic, copy) NSString *book_name;

+(NSMutableArray *)parseData:(id)respondObject;
@end
