//
//  GCAlertView.h
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#ifndef GCAlertView_h
#define GCAlertView_h

#import <UIKit/UIKit.h>

@class GCAlertView;

@protocol GCAlertViewDelegate <NSObject>

- (void)onDelelte:(GCAlertView*)sender;

@end

@interface GCAlertView : UIView

@property (nonatomic, weak) id<GCAlertViewDelegate> delegater;
@property (nonatomic, assign) NSInteger selectIndex;

- (IBAction)confirm:(id)sender;

- (IBAction)cancel:(id)sender;

- (void)show:(CGPoint)center;

@end

#endif /* GCAlertView_h */
