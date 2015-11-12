//
//  GCStoreSystemMgr.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "GCStoreSystemMgr.h"
#import "GCColorDataMgr.h"

static GCStoreSystemMgr* _instance;

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

- (void)retriveData:(GCColorStoreType)type {
	
	switch (type) {
  case GCColorStoreType_encode:
		{
			NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self fileName2docFilePath:@"appData"]];
			
			NSKeyedUnarchiver *un = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
			
			NSObject* obj = [un decodeObjectForKey:@"encodeColorData"];
			
			[[GCColorDataMgr sharedInstance] setColorData:obj];
		}
			break;
			
  default:
			break;
	}
}

- (void)saveData:(NSObject*)obj byStore:(GCColorStoreType)type {
	
	switch (type) {
			
  case GCColorStoreType_encode:
		{
			NSMutableData *data = [[NSMutableData alloc] init];
			
			NSKeyedArchiver *ar = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
			
			NSObject* dataArray = [[GCColorDataMgr sharedInstance] getColorData];
			
			[ar encodeObject:dataArray forKey:@"encodeColorData"];
			
			[ar finishEncoding];
			
			[data writeToFile:[self fileName2docFilePath:@"appData"] atomically:YES];
		}
			break;
			
  default:
			break;
	}
}

@end
