//
//  GCAlertView.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCAlertView.h"

@implementation GCAlertView

- (void)show:(CGPoint)center {
	
	[self setCenter:center];
}

- (IBAction)cancel:(id)sender {
	
	[self removeFromSuperview];
}

- (IBAction)confirm:(id)sender {
	
	[_delegater onDelelte:self];
	
	[self removeFromSuperview];
}

@end