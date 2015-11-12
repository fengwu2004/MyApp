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

- (void)loadData {
	
	[_colorDataSource removeAllObjects];
	
	[_colorDataSource addObjectsFromArray:[[GCStoreSystemMgr sharedInstance] retriveData:_dataStoreType]];
}

- (NSArray*)retriveColorData:(GCStoreType)type {

	_dataStoreType = type;
	
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

- (void)setColorData:(NSObject*)obj {
	
	[_colorDataSource removeAllObjects];
	
	[_colorDataSource addObjectsFromArray:(NSArray*)obj];
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
