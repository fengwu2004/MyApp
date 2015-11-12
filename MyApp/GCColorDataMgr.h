//
//  GCColorDataMgr.h
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCColorDefine.h"

@interface GCColorDataMgr : NSObject

@property (nonatomic, assign) GCColorStoreType dataStoreType;

+ (id)sharedInstance;

- (void)loadData:(GCColorStoreType)type;

- (NSArray*)retriveColorData:(GCColorStoreType)type;

- (void)saveColor:(GCColorData*)color new:(BOOL)isNewColor;

- (void)setColorData:(NSObject*)obj;

- (NSArray*)getColorData;

@end
