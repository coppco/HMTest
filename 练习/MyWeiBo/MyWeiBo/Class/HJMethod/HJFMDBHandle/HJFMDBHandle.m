//
//  HJFMDBHandle.m
//  XHJTool
//
//  Created by coco on 16/3/29.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "HJFMDBHandle.h"
#import <FMDB.h>



static FMDatabaseQueue *my_FMDatabaseQueue = nil;
static FMDatabase *database = nil;

@implementation HJFMDBHandle
/**
 *  获取数据库文件路径
 *
 *  @return 返回数据库文件路径
 */
+ (NSString *)getDatabaseFile {
    NSString *dbFile = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:DataBaseName];
    
    return dbFile;
}
//多线程操作安全
+ (FMDatabaseQueue *)sharedDatabaseQueue {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!my_FMDatabaseQueue) {
            my_FMDatabaseQueue = [FMDatabaseQueue databaseQueueWithPath:[self getDatabaseFile]];
        }
    });
    return my_FMDatabaseQueue;
}
//获取数据库
+ (FMDatabase *)sharedFMDatabase {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!database) {
            database = [FMDatabase databaseWithPath:[self getDatabaseFile]];
        }
    });
    return database;
}
+ (BOOL)deleteFMDatabase {
    BOOL success = NO;
    NSFileManager *file = [NSFileManager defaultManager];
    if ([file fileExistsAtPath:[self getDatabaseFile]]) {
        [database close];
        NSError *error = nil;
        success = [file removeItemAtPath:[self getDatabaseFile] error:&error];
        if (!success) {
            NSAssert1(0, @"Failed to delete old database file with message '%@'.", [error localizedDescription]);
        }
    }
    return success;
}
//创建表
+ (BOOL)createTableWithSQLString:(NSString *)sqlString {
    BOOL success = NO;
    FMDatabase *db = [self sharedFMDatabase];
    if (![db open]) {
        return success;
    }
    //设置缓存,提高效率
    [db setShouldCacheStatements:YES];
    success = [db executeUpdate:sqlString];
    [db close];
    return success;
}

@end
