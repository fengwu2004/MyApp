//
//  GCStoreSystemMgr.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "GCStoreSystemMgr.h"
#import "GCColorDataMgr.h"
#import "sqlite3.h"

static GCStoreSystemMgr* _instance;

@interface GCStoreSystemMgr() {
	
	sqlite3 *dataBase;
}

@end

@implementation GCStoreSystemMgr

+ (id)sharedInstance {
	
	if (!_instance) {
		
		_instance = [[GCStoreSystemMgr alloc] init];
	}
	
	return _instance;
}

- (NSString *)fileName2docFilePath:(NSString *)fileName {
	
	if (!fileName || [fileName isEqualToString:@""]) {
		
		return nil;
	}
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *documentsDirectory = [paths objectAtIndex:0];
	
	NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
	
	return filePath;
}

- (NSArray*)retriveData:(GCColorStoreType)type {
	
	switch (type) {
  case GCColorStoreType_encode:
		{
			NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self fileName2docFilePath:@"appData"]];
			
			NSKeyedUnarchiver *un = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
			
			NSObject* obj = [un decodeObjectForKey:@"encodeColorData"];
			
			return (NSArray*)obj;
		}
			break;
	case GCColorStoreType_plist:
		{
			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			
			NSString *plistPath1 = [paths objectAtIndex:0];
			
			NSString *filename = [plistPath1 stringByAppendingPathComponent:@"colorData.plist"];
			
			NSMutableArray* dicArray = [[NSMutableArray alloc] initWithContentsOfFile:filename];
			
			NSMutableArray* dataArray = [[NSMutableArray alloc] init];
			
			for (NSDictionary* dic in dicArray) {
    
				[dataArray addObject:[[GCColorData alloc] objectFromDic:dic]];
			}
			
			return dataArray;
		}
			break;
	case GCColorStoreType_sqlite:
		{
			return [self queryAllData];
		}
			break;
  default:
			break;
	}
	
	return [[NSArray alloc] init];
}

- (void)openDB {
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	
	NSString *filePath = [paths objectAtIndex:0];
	
	NSString* databasePath = [[NSString alloc] initWithString:[filePath stringByAppendingPathComponent:@"colorData.db"]];
	
	const char *dbpath = [databasePath UTF8String];
	
	if (sqlite3_open(dbpath, &dataBase) == SQLITE_OK) {
		
		NSString *createsql = @"CREATE TABLE IF NOT EXISTS colorInfo (\
		ID INTEGER PRIMARY KEY AUTOINCREMENT, \
		NAME TEXT, \
		RED INTEGER,\
		GREEN INTEGER,\
		BLUE INTEGER)";
		
		[self execSql:createsql];
	}
}

- (int)execSql:(NSString*)sql {
	
	char *errorMsg;
	
	int result = sqlite3_exec(dataBase, [sql UTF8String], NULL, NULL, &errorMsg);
	
	return result;
}

- (void)saveToDB:(GCColorData*)data {
	
	NSString *insertSql = [NSString stringWithFormat:@"INSERT OR REPLACE INTO colorInfo(NAME,RED,GREEN,BLUE) VALUES('%@',%d,%d,%d)", data.strName, (int)data.red, (int)data.green, (int)data.blue];
	
	[self execSql:insertSql];

	
	sqlite3_close(dataBase);
}

- (NSArray*)queryAllData {
	
	[self openDB];
	
	NSString *sql = @"SELECT * FROM colorInfo";
	
	sqlite3_stmt *info;
	
	NSMutableArray* dataArray = [[NSMutableArray alloc] init];
	
	if (sqlite3_prepare_v2(dataBase, [sql UTF8String], -1, &info, nil) == SQLITE_OK) {
		
		while (sqlite3_step(info) == SQLITE_ROW) {
			
			GCColorData* data = [[GCColorData alloc] init];
			
			char *name = (char *)sqlite3_column_text(info, 1);
			
			data.strName = [[NSString alloc] initWithUTF8String:name];
			
			data.red = sqlite3_column_int(info, 2);
			
			data.green = sqlite3_column_int(info, 3);
			
			data.blue = sqlite3_column_int(info, 4);
			
			[dataArray addObject:data];
		}
		
		sqlite3_finalize(info);
	}
	
	return dataArray;
}

- (void)saveData:(GCColorData*)obj byStore:(GCColorStoreType)type {
	
	NSArray* dataArray = [[GCColorDataMgr sharedInstance] getColorData];
	
	switch (type) {
			
  case GCColorStoreType_encode:
		{
			NSMutableData *data = [[NSMutableData alloc] init];
			
			NSKeyedArchiver *ar = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
			
			[ar encodeObject:dataArray forKey:@"encodeColorData"];
			
			[ar finishEncoding];
			
			[data writeToFile:[self fileName2docFilePath:@"appData"] atomically:YES];
		}
			break;
	case GCColorStoreType_plist:
		{
			NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			
			NSString *plistPath1 = [paths objectAtIndex:0];
			
			NSString *filename = [plistPath1 stringByAppendingPathComponent:@"colorData.plist"];
			
			if ([[NSFileManager defaultManager] fileExistsAtPath:filename] == NO) {
    
				[[NSFileManager defaultManager] createFileAtPath:filename contents:nil attributes:nil];
			}
			
			NSMutableArray* array = [[NSMutableArray alloc] init];
															 
			for (GCColorData* data in dataArray) {
    
				[array addObject:[data dicFromObject]];
			}
			
			BOOL success = [array writeToFile:filename atomically:NO];
			
			if (success) {
    
				NSLog(@"写入plist成功");
			}
		}
			break;
	case GCColorStoreType_sqlite:
		{
			[self openDB];
			
			[self saveToDB:obj];
		}
			break;
  default:
			break;
	}
}

- (void)removeColor:(NSInteger)objId {
	
	
}


@end
