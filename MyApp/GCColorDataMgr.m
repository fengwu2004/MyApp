//
//  GCColorDataMgr.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "GCColorDataMgr.h"


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
		
		[self test];
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

- (NSArray*)retriveColorData:(GCColorStoreType)type {
	
	return _colorDataSource;
}

- (void)saveColor:(GCColorData*)color new:(BOOL)isNewColor {
	
	if (isNewColor) {
		
		[_colorDataSource addObject:color];
	}
}

@end
