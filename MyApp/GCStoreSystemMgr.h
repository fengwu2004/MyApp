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

- (void)saveData:(GCColorData*)obj byStore:(GCStoreType)type;

- (void)removeColor:(NSInteger)colorId withStoreType:(GCStoreType)storeType;

- (NSArray*)retriveData:(GCStoreType)type;

@end
