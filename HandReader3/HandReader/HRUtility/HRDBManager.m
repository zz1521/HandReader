//
//  HRDBManager.m
//  HandReader
//
//  Created by qianfeng0 on 16/4/2.
//  Copyright © 2016年 LiPengfei. All rights reserved.
//

#import "HRDBManager.h"
#import "FMDatabase.h"

@interface HRDBManager ()
//使用db变量来操作数据库
@property(nonatomic)FMDatabase *db;
@end


@implementation HRDBManager

+ (instancetype)sharedInstance{
    static HRDBManager *s_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_instance == nil) {
            s_instance = [[HRDBManager alloc]init];
        }
    });
    return s_instance;
}

- (NSString*)dataBasePath{
    NSLog(@"%@",NSHomeDirectory());

    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/CollectionBook.db"];
}

- (id)init{
    if (self = [super init]) {
        //根据路径初始化db
    
        self.db = [[FMDatabase  alloc]initWithPath:[self dataBasePath]];
        if ([self.db open]) {
            //open 如果数据库不存在，则创建数据库，否则把数据库打开
            [self createTable];
        }
    }
    return self;
}

- (void)createTable{
//NSString *sql =  @"CREATE TABLE IF NOT EXISTS CollectionBook(bookName TEXT PRIMARY KEY AUTOINCREMENT,author TEXT,img_url BLOB,gid INTEGER,nid INTEGER,sort INTEGER,chapter_name TEXT)";
NSString *sql =  @"CREATE TABLE IF NOT EXISTS CollectionBook(bookID INTEGER PRIMARY KEY AUTOINCREMENT, bookName TEXT,author TEXT,img_url BLOB,gid INTEGER ,nid INTEGER,sort INTEGER,chapter_name TEXT)";
    //执行sql语句
    //只有select语句 才使用 executeQuery
    //[self.db executeQuery:<#(NSString *), ...#>];
    
    //除了select语句之外都使用executeUpdate
    BOOL bRet = [self.db executeUpdate:sql];
    if (bRet) {
        NSLog(@"创建user表成功");
    }else{
        NSLog(@"创建user表失败");
    }
}



- (void)collectBook:(HRSaveBookModel*)bookModel{
//    ？是占为符，使用user中的值进行替换,？的个数跟参数的个数保持一致
    NSString *sql = @"INSERT INTO CollectionBook(bookName,author,img_url,gid,nid) VALUES(?,?,?,?,?)";
//    替换？时必须使用对象类型，int，float,double等基本数据类型必须转换成对象类型,@(user.age) 把int转成NSNumber
//    
//    保证类型匹配，需要把UIImage 转换成NSData
//    UIImageJPEGRepresentation 把图片转换成NSData
//    第二个参数是压缩质量，取值范围 0 ~1.0
//    NSData *imageData = UIImageJPEGRepresentation(user.headImage, 0.5);
    NSString *bookName = bookModel.name;
    NSString *author = bookModel.author;
    NSURL *url = [NSURL URLWithString:bookModel.img_url];
    NSData *img_url = [NSData dataWithContentsOfURL:url];
    NSInteger gid = bookModel.gid;
    NSInteger nid = bookModel.nid;
    BOOL bRet = [self.db executeUpdate:sql,bookName,author,img_url,@(gid),@(nid)];
    if(bRet){
        NSLog(@"插入数据成功");
    }else{
        NSLog(@"插入数据失败");
    }

}
- (void)deleteCollectBook:(HRSaveBookModel*)bookModel{
    NSString *sql = @"DELETE FROM CollectionBook WHERE bookName != ?";
    BOOL bRet = [self.db executeUpdate:sql,nil];
    if (bRet) {
        NSLog(@"删除数据成功");
    }else{
        NSLog(@"删除数据失败");
    }
    
}


-(BOOL)isCollectionBook:(NSString *)bookName{
    NSInteger flag = 0;
    NSString *sql = @"select bookName from CollectionBook";
    
    //查询整个表
    FMResultSet *resultSet = [self.db executeQuery:sql];
    while ([resultSet next]) {
        NSString *bookNameTemp = [resultSet stringForColumn:@"bookName"];
        NSLog(@"bookNameTemp = %@    ----%@",bookNameTemp,bookName);
        if ([bookName isEqualToString:bookNameTemp]) {
            flag = 1;
            break;
        }
    
    }

    if (flag) {
        NSLog(@"已经收藏过了");
        return YES;
    }else{
        NSLog(@"还没有收藏");
        return NO;
    }
}



- (void)updateCollectBook:(HRChaptersModel*)bookModel{
    //bookID INTEGER PRIMARY KEY AUTOINCREMENT, bookName TEXT,author TEXT,img_url BLOB,gid INTEGER ,nid INTEGER,sort INTEGER,chapter_name TEXT
    
    
    NSString *sql = @"UPDATE CollectionBook SET sort = ?,chapter_name = ? WHERE nid = ?";
    BOOL ret = [self.db executeUpdate:sql,@(bookModel.sort),bookModel.chapter_name,@(bookModel.nid)];
    if (ret) {
        NSLog(@"修改数据成功");
    }else{
        NSLog(@"修改数据失败");
    }
    
}
- (NSArray*)allCollectBook{
    NSMutableArray *userArray = [NSMutableArray array];
    NSString *sql = @"SELECT * FROM CollectionBook";
    //执行查询,使用语句executeQuery
    //返回的是结果集，需要我们变量结果集把每一条记录提取出来
    FMResultSet *result = [self.db executeQuery:sql];
    while ([result next]) {
        //next每次从结果集中提取一行，提取完成后，返回nil
        //把每行数据转换成对应的model （ORMapping 对象关系映射）
        HRSaveBookModel *collectBook = [[HRSaveBookModel alloc]init];
        collectBook.author = [result stringForColumn:@"author"];
        collectBook.name = [result stringForColumn:@"bookName"];
        collectBook.gid   = [result intForColumn:@"gid"];
        collectBook.nid  = [result intForColumn:@"nid"];
        collectBook.chapter_name = [result stringForColumn:@"chapter_name"];
        collectBook.sort = [result intForColumn:@"sort"];
        NSData *data = [result dataForColumn:@"img_url"];
        collectBook.bookImageData = [UIImage imageWithData:data];
        [userArray addObject:collectBook];
    }
    return userArray;
}
@end
