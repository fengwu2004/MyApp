//
//  GCColorDefine.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "GCColorDefine.h"



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

@end
