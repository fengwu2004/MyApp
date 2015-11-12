//
//  GCColorDefine.h
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GCColorStoreType) {
	
	GCColorStoreType_encode,
	GCColorStoreType_plist,
	GCColorStoreType_sqlite,
};

typedef NS_ENUM(NSUInteger, GCColorEditType) {
	
	GCColorEditType_createNewColor,
	GCColorEditType_editCurrentColor,
};

@interface GCColorData : NSObject

@property (nonatomic, copy) NSString* strName;
@property (nonatomic, assign) NSInteger red;
@property (nonatomic, assign) NSInteger green;
@property (nonatomic, assign) NSInteger blue;

@end
