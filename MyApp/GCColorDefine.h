//
//  GCColorDefine.h
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

#define COLOR_ID			@"colorid"
#define COLOR_NAME		@"colorname"
#define COLOR_RED			@"red"
#define COLOR_GREEN		@"green"
#define COLOR_BLUE		@"blue"
#define COLOR_CREATE	@"createat"

typedef NS_ENUM(NSUInteger, GCStoreType) {
	
	GCStoreType_encode,
	GCStoreType_plist,
	GCStoreType_sqlite,
};

@interface GCColorData : NSObject<NSCoding>

@property (nonatomic, assign) NSInteger colorId;
@property (nonatomic, copy) NSString* strName;
@property (nonatomic, assign) NSInteger red;
@property (nonatomic, assign) NSInteger green;
@property (nonatomic, assign) NSInteger blue;
@property (nonatomic, assign) NSInteger createTime;

- (NSDictionary*)dicFromObject;

- (id)objectFromDic:(NSDictionary*)dic;

@end
