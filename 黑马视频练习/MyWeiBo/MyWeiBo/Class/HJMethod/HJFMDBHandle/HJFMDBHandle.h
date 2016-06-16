//
//  HJFMDBHandle.h
//  XHJTool
//
//  Created by coco on 16/3/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;
@class FMDatabaseQueue;
/*数据库名字*/
#define DataBaseName @"Common.sqlite" //数据库名字
/*数据库表名1*/
#define Common_table @"common_table" //数据库表名1
/*数据库表名1的建表语句*/
#define CreateCommon_table \
[NSString stringWithFormat:@"create table if not exists %@ (dbId integer primary key autoincrement not null, beginTime text, endTime text)", Common_table]

@interface HJFMDBHandle : NSObject
/**
 *  多线程操作数据库,来保证线程安全
 *
 *  @return
 */
+ (FMDatabaseQueue *)sharedDatabaseQueue;
/**
 *  获取一个数据库
 *
 *  @return
 */
+ (FMDatabase *)sharedFMDatabase;
/**
 *  删除数据库
 *
 *  @return
 */
+ (BOOL)deleteFMDatabase;
/**
 *  创建数据库表
 *
 *  @param sqlString   建表的sql语句
 *
 *  @return
 */
+ (BOOL)createTableWithSQLString:(NSString *)sqlString;
@end
