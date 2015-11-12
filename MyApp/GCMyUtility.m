//
//  GCMyUtility.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "GCMyUtility.h"

@implementation GCMyUtility

+ (NSString*)strFromeDate:(NSDate*)date {
	
	NSDateFormatter	*formatter = [[NSDateFormatter alloc] init];
	
	[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
	
	NSString *str;
	
	str = [formatter stringFromDate:date];
	
	return str;
}

+ (NSDate*)dateFromeStr:(NSString*)str {
	
	NSDateFormatter	*formatter =[[NSDateFormatter alloc] init];
	
	[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
	
	NSDate *aDate = [formatter dateFromString:str];;
	
	return aDate;
}


@end
