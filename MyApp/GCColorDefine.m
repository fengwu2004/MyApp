//
//  GCColorDefine.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "GCColorDefine.h"


#define LONG2STR(x) [NSString stringWithFormat:@"%ld", (x)]

@implementation GCColorData

-(void)encodeWithCoder:(NSCoder *)encoder {
	
	[encoder encodeObject:_strName forKey:COLOR_NAME];
	
	[encoder encodeInteger:_red forKey:COLOR_RED];
	
	[encoder encodeInteger:_green forKey:COLOR_GREEN];
	
	[encoder encodeInteger:_blue forKey:COLOR_BLUE];
}

- (id)initWithCoder:(NSCoder *)decoder {
	
	_strName = [decoder decodeObjectForKey:COLOR_NAME];
	
	_red = [decoder decodeIntegerForKey:COLOR_RED];
	
	_green = [decoder decodeIntegerForKey:COLOR_GREEN];
	
	_blue = [decoder decodeIntegerForKey:COLOR_BLUE];
	
	return self;
}

- (NSDictionary*)dicFromObject {
	
	NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
	
	[dic setObject:_strName forKey:COLOR_NAME];
	
	[dic setObject:LONG2STR((long)_red) forKey:COLOR_RED];
	
	[dic setObject:LONG2STR((long)_green) forKey:COLOR_GREEN];
	
	[dic setObject:LONG2STR((long)_blue) forKey:COLOR_BLUE];
	
	return dic;
}

- (id)objectFromDic:(NSDictionary*)dic {
	
	_strName = [dic objectForKey:COLOR_NAME];
	
	_red = [[dic objectForKey:COLOR_NAME] integerValue];
	
	_green = [[dic objectForKey:COLOR_NAME] integerValue];
	
	_blue = [[dic objectForKey:COLOR_NAME] integerValue];
	
	return self;
}

@end
