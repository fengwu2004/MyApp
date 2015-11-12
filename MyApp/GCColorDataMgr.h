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

+ (id)sharedInstance;

- (NSArray*)retriveColorData:(GCColorStoreType)type;

@end
