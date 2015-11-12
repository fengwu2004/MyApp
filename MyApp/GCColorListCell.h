//
//  GCColorListCell.h
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#ifndef GCColorListCell_h
#define GCColorListCell_h

#import <UIKit/UIKit.h>
#import "GCColorDefine.h"

@interface GCColorListCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel* ibLabelName;
@property (nonatomic, retain) IBOutlet UILabel* ibLabelColorRed;
@property (nonatomic, retain) IBOutlet UILabel* ibLabelColorGreen;
@property (nonatomic, retain) IBOutlet UILabel* ibLabelColorBlue;
@property (nonatomic, retain) IBOutlet UIView* ibViewColor;


- (void)setColorData:(GCColorData*)coloData;

@end

#endif /* GCColorListCell_h */
