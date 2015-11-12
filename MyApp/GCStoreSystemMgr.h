//
//  GCStoreSystemMgr.h
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCColorDefine.h"

@interface GCStoreSystemMgr : NSObject

+ (id)sharedInstance;

- (void)saveData:(GCColorData*)obj byStore:(GCColorStoreType)type;

- (void)removeColor:(NSInteger)colorId withStoreType:(GCColorStoreType)storeType;

- (NSArray*)retriveData:(GCColorStoreType)type;

@end
