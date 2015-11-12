//
//  GCColorDefine.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "GCColorDefine.h"
#import "GCMyUtility.h"

#define LONG2STR(x) [NSString stringWithFormat:@"%ld", (x)]

@implementation GCColorData

-(void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:_strName forKey:COLOR_NAME];
	
	[encoder encodeInteger:_colorId forKey:COLOR_ID];
	
	[encoder encodeInteger:_red forKey:COLOR_RED];
	
	[encoder encodeInteger:_green forKey:COLOR_GREEN];
	
	[encoder encodeInteger:_blue forKey:COLOR_BLUE];
	
	[encoder encodeInteger:_createTime forKey:COLOR_CREATE];
}

- (id)initWithCoder:(NSCoder *)decoder {
	
	_strName = [decoder decodeObjectForKey:COLOR_NAME];

	_colorId = [decoder decodeIntegerForKey:COLOR_ID];
	
	_red = [decoder decodeIntegerForKey:COLOR_RED];
	
	_green = [decoder decodeIntegerForKey:COLOR_GREEN];
	
	_blue = [decoder decodeIntegerForKey:COLOR_BLUE];
	
	_createTime = [decoder decodeIntegerForKey:COLOR_CREATE];
	
	return self;
}

- (id)copyWithZone:(NSZone *)zone {
	
	GCColorData *data = [[[self class] allocWithZone:zone] init];
	
	data.strName = [_strName copyWithZone:zone];
	
	data.colorId = _colorId;
	
	data.red = _red;
	
	data.green = _green;
	
	data.blue = _blue;
	
	data.createTime = _createTime;
	
	return data;
}

- (NSDictionary*)dicFromObject {
	
	NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
	
	[dic setObject:_strName forKey:COLOR_NAME];
	
	[dic setObject:LONG2STR((long)_colorId) forKey:COLOR_ID];
	
	[dic setObject:LONG2STR((long)_red) forKey:COLOR_RED];
	
	[dic setObject:LONG2STR((long)_green) forKey:COLOR_GREEN];
	
	[dic setObject:LONG2STR((long)_blue) forKey:COLOR_BLUE];
	
	[dic setObject:LONG2STR((long)_createTime) forKey:COLOR_CREATE];
	
	return dic;
}

- (id)objectFromDic:(NSDictionary*)dic {
	
	_strName = [dic objectForKey:COLOR_NAME];
	
	_colorId = [[dic objectForKey:COLOR_ID] integerValue];
	
	_red = [[dic objectForKey:COLOR_RED] integerValue];
	
	_green = [[dic objectForKey:COLOR_GREEN] integerValue];
	
	_blue = [[dic objectForKey:COLOR_BLUE] integerValue];
	
	_createTime = [[dic objectForKey:COLOR_CREATE] integerValue];
	
	return self;
}

@end
