//
//  HRReaderHeader.h
//  HandReader
//
//  Created by qianfeng0 on 16/3/26.
//  Copyright (c) 2016年 LiPengfei. All rights reserved.
//

#ifndef HandReader_HRReaderHeader_h
#define HandReader_HRReaderHeader_h




//传入RGBA四个参数，得到颜色
//美工和设计通过PS给出的色值是0~255
//苹果的RGB参数给出的是0~1
#define HR_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//传入RGB三个参数，得到颜色
#define HR_RGB(r,g,b) HR_RGBA(r,g,b,1.f)
//取得随机颜色
#define HR_RandomColor HR_RGB(arc4random()%256,arc4random()%256,arc4random()%256)



#define HR_WIDTH_SCRENN  [UIScreen mainScreen].bounds.size.width
#define HR_HEIGHT_SCRENN [UIScreen mainScreen].bounds.size.height
#define HR_VIEW_SIZE     self.view.frame.size

/*  ***********总********** */
#define HR_URL_BOOKSHELF @"http://api.easou.com/api/bookapp/%@.m?a=1&cid=eef_easou_book&version=002&os=android&appverion=4"
/*  ***********排行********** */
#define HR_RANK @"rank"
/*  ***********分类********** */
#define HR_CATEGARY  @"category_list"
/*  ***********标签********** */
#define HR_HOT_LABRL @"hot_label"

/*  ***********书籍列表********** */
#define HR_URL_BOOKLIST @"http://api.easou.com/api/bookapp/rank_book.m?type=%ld&ranktype=%ld&page_id=%ld&cid=eef_easou_book&version=002&os=android&appverion=4"
/*  ***********书籍详情********** */
#define HR_URL_BOOKDETAIL @"http://api.easou.com/api/bookapp/cover.m?gid=%ld&cid=eef_easou_book&version=002&os=android&appverion=4"
/*  **********书籍章节列表******** */
#define HR_URL_CHAPTERLIST @"http://api.easou.com/api/bookapp/chapter_list.m?gid=%ld&nid=%ld&page_id=1&size=2147483647&cid=eef_easou_book&version=002&os=android&appverion=4"
/*  ************单章详情********** */
#define HR_READER_DETAIL @"http://api.easou.com/api/bookapp/batch_chapter.m?a=1&cid=eef_easou_book&version=002&os=android&appverion=4"
// post   &gid=%ld&nid=%ld&sort=%ld&gsort=0&sequence=5&chapter_name=%@
/*  ************分类书籍列表********** */
/* 参数 word  分类类型 ：言情 玄幻 都市 武侠 网游  历史 校园 灵异 科幻 剧情 名著 侦探 经典 教育 哲学 财经 军事 纪实 耽美 诗文 外文 笑话 健康 其他 轻小说 */
#define HR_CATEGARY_SEARCH @"http://api.easou.com/api/bookapp/search.m?word=%@&type=2&page_id=%ld&count=20&sort_type=0&cid=eef_easou_book&version=002&os=android&appverion=4"


/*   *********精选********  */
#define HR_CLASS_ARRAY  @[@"HRSelectionViewController",@"HRBookshelfViewController",@"HRCartoonViewController",@"HRUserViewController"]
#define HR_ITEMS_ARRAY @[@"书架",@"书库",@"卡通",@"我"]

//精选（0 = 男频  1 = 女频）
#define HR_URL_SECTION_BOY @"http://4g.if.qidian.com/Atom.axd/Api/BookStore/GetBookStoreList?sId=0"
#define HR_URL_SECTION_GRIL @"http://4g.if.qidian.com/Atom.axd/Api/BookStore/GetBookStoreList?sId=1"

#define HR_URL_ICON @"http://4g.if.qidian.com/Atom.axd/Api/Book/GetCover?bookId=%ld"
//分类
#define HR_URL_CATEGARY @"http://4g.if.qidian.com/Atom.axd/Api/Client/GetDiscoverList?sId=0"

#define HR_URL_DETAIL @"http://4g.if.qidian.com/Atom.axd/Api/Book/Get?bookId=%ld&preview=0"

//search(post)
#define HR_URL_SEARCH @"http://m.ybdu.com/modules/article/search.php"
//searchtype=articlename&searchkey=%@&submit=
/*   *********精选********  */





/*************漫画界面****************/
#define HR_URL_CARTOON @"http://app.u17.com/v3/app/android/phone/list/index?size=40&page=1&argName=sort&argValue=0"

////////////////书的简介详情 参数  comic_id
#define HR_URL_CARTOON_DETAL @"http://app.u17.com/v3/app/android/phone/comic/detail?comicid=%ld"

////////////////漫画详情 参数   chapter_id
#define HR_URL_CARTOON_DETAL_PIC @"http://app.u17.com/v3/app/android/phone/comic/chapter?chapter_id=%@"


#endif
