//
//  GCColorDataMgr.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "GCColorDataMgr.h"
#import "GCStoreSystemMgr.h"

static GCColorDataMgr* _instance;

@interface GCColorDataMgr()

@property (nonatomic, retain) NSMutableArray* colorDataSource;

@end

@implementation GCColorDataMgr

+ (id)sharedInstance {
	
	if (!_instance) {
		
		_instance = [[GCColorDataMgr alloc] init];
	}
	
	return _instance;
}

- (id)init {
	
	self = [super init];
	
	if (self) {
		
		_colorDataSource = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void)test {
	
	GCColorData* color = [[GCColorData alloc] init];
	
	color.strName = @"我的颜色";
	
	color.red = 100;
	
	color.green = 255;
	
	color.blue = 100;
	
	[_colorDataSource addObject:color];
}

- (BOOL)pd_isEarlierFrom:(NSDate*)date1 toDate:(NSDate*)date2  {
	
	if ([date1 timeIntervalSinceDate:date2] >=0) {
		
		return NO;
	}
	else {
		
		return YES;
	}
}

- (void)sort:(NSArray*)array {
	
	NSComparator cmptr = ^(id obj1, id obj2){
		
		GCColorData* data1 = (GCColorData*)obj1;
		
		GCColorData* data2 = (GCColorData*)obj2;
		
		if ([self pd_isEarlierFrom:data1.created_at toDate:data2.created_at]) {
			
			return (NSComparisonResult)NSOrderedDescending;
		}
		
		return (NSComparisonResult)NSOrderedAscending;
	};
	
	NSArray *tempArray = [array sortedArrayUsingComparator:cmptr];
	
	[_colorDataSource removeAllObjects];
	
	[_colorDataSource addObjectsFromArray:tempArray];
}

- (BOOL)loadData {
	
	NSArray* array = [[NSArray alloc] initWithArray:[[GCStoreSystemMgr sharedInstance] retriveData:_dataStoreType]];
	
	[self sort:array];
	
	if (_colorDataSource.count == 0) {
		
		return NO;
	}
	
	return YES;
}

- (NSArray*)retriveColorData {
	
	[self loadData];
	
	return _colorDataSource;
}

- (void)addOrReplace:(GCColorData*)color {
	
	GCColorData* data = [self findColorById:color.colorId];
	
	if (data) {
		
		data.strName = color.strName;
		
		data.red = color.red;
		
		data.green = color.green;
		
		data.blue = color.blue;
		
		data.created_at = color.created_at;
	}
	else {
		
		color.colorId = _colorDataSource.count;
		
		[_colorDataSource addObject:color];
	}
	
	[[GCStoreSystemMgr sharedInstance] saveData:color byStore:_dataStoreType];
}

- (void)removeColorById:(NSInteger)colorId {
	
	GCColorData* color = [self findColorById:colorId];
	
	if (!color) {
		
		return;
	}
	
	[_colorDataSource removeObject:color];
	
	[[GCStoreSystemMgr sharedInstance] removeColor:colorId withStoreType:_dataStoreType];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"colorDeleteSuccess" object:nil];
}

- (void)setColorData:(NSArray*)dataArray {
	
	[_colorDataSource removeAllObjects];
	
	[_colorDataSource addObjectsFromArray:dataArray];
}

- (NSArray*)getColorData {
	
	return _colorDataSource;
}

- (GCColorData*)createColor {
	
	GCColorData* data = [[GCColorData alloc] init];
	
	data.colorId = _colorDataSource.count;
	
	return data;
}

- (GCColorData*)findColorById:(NSInteger)colorId {
	
	for (GCColorData* data in _colorDataSource) {
		
		if (data.colorId == colorId) {
			
			return data;
		}
	}
	
	return nil;
}

@end
