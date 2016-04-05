//
//  HRSaveBookModel.h
//  HandReader
//
//  Created by qianfeng0 on 16/4/2.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRSaveBookModel : NSObject
/*{
    "name": "狼王梦",
    "classes": "完结,言情",
    "desc": "　　在狼的世界里，母性并非是温情的代名词，相反的，则充满了男性的刚烈和坚决。然而，在残酷的丛林生存法则中，母狼的行为实在是无可厚非，她对权力欲望的追求实质上体现对一种自尊的、自由的生命价值的永恒追寻。比对人在现代社会中异化和变形的无能，狼的精神世界令人肃然起敬。",
    "gid": 1630921,
    "category": "言情",
    "nid": 13618370,
    "author": "沈石溪",
    "site": "muyuge.com",
    "img_url": "http://image.book.easou.com/i/wanshulou/28/wanshulou_com_28873/28873_2.jpg",
    "last_sort": 25,
    "last_time": 1448724319718,
    "last_chapter_name": "牝狼 5",
}*/


@property (nonatomic, copy) NSString *last_chapter_name;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, assign) NSInteger last_sort;

@property (nonatomic, copy) NSString *classes;
@property (nonatomic, copy) NSString *topic_group_name;
@property (nonatomic, copy) NSString *author;

@property (nonatomic, assign) NSInteger nid;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger gid;

@property (nonatomic, copy) NSString *img_url;

@property (nonatomic, assign) long long last_time;

@property (nonatomic, copy) NSString *site;

@property (nonatomic, copy) NSString *name;


/* ************自定义添加************ */
@property (nonatomic)NSInteger sort;
@property(nonatomic)NSString *chapter_name;
@property (nonatomic) UIImage *bookImageData;

@end
