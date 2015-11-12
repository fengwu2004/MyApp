//
//  GCColorListVCTL.h
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#ifndef GCColorListVCTL_h
#define GCColorListVCTL_h

#import <UIKit/UIKit.h>
#import "GCColorDefine.h"

@interface GCColorListVCTL : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView* ibTableColor;
@property (nonatomic, assign) GCColorStoreType storeType;

@end


#endif /* GCColorListVCTL_h */
