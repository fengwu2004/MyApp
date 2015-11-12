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

@property (nonatomic, assign) GCStoreType dataStoreType;

+ (id)sharedInstance;

- (NSArray*)retriveColorData:(GCStoreType)type;

- (void)setColorData:(NSObject*)obj;

- (NSArray*)getColorData;

- (GCColorData*)findColorById:(NSInteger)colorId;

- (void)addOrReplace:(GCColorData*)color;

- (void)removeColorById:(NSInteger)colorId;

- (GCColorData*)createColor;

@end
