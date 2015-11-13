//
//  GCColorListCell.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GCColorListCell.h"

@implementation GCColorListCell

- (void)awakeFromNib {
	
	[super awakeFromNib];
}

- (void)setColorData:(GCColorData*)colorData {
	
	[_ibLabelName setText:colorData.strName];
	
	NSString* strRed = [[NSString alloc] initWithFormat:@"R: %d", (int)colorData.red];
	
	[_ibLabelColorRed setText:strRed];
	
	NSString* strGreen = [[NSString alloc] initWithFormat:@"G: %d", (int)colorData.green];
	
	[_ibLabelColorGreen setText:strGreen];
	
	NSString* strBlue = [[NSString alloc] initWithFormat:@"B: %d", (int)colorData.blue];
	
	[_ibLabelColorBlue setText:strBlue];
	
	UIColor *color = [UIColor colorWithRed:colorData.red/255.0 green:colorData.green/255.0 blue:colorData.blue/255.0 alpha:1];
	
	[_ibViewColor setBackgroundColor:color];
}

@end
