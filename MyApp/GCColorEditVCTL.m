//
//  GCColorEditVCTL.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCColorEditVCTL.h"
#import "GCColorDataMgr.h"

@interface GCColorEditVCTL()<UITextFieldDelegate>

@property (nonatomic, retain)GCColorData* colorData;

@end

@implementation GCColorEditVCTL

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	
	return self;
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	[self setTitleBar];
	
	if (_isCreateNew) {
		
		_colorData = [[GCColorData alloc] init];
	}
	
	_ibColorName.keyboardAppearance = UIKeyboardAppearanceDefault;
}

- (void)setTitleBar {
	
	if (_isCreateNew) {
		
		[self setTitle:@"创建新颜色"];
	}
	else {
		
		[self setTitle:@"编辑颜色"];
	}
	
	UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveColor)];
	
	self.navigationItem.rightBarButtonItem = item;
}

- (void)viewWillAppear:(BOOL)animated {

	[_ibColorName setText:_colorData.strName];
	
	UIColor *color = [UIColor colorWithRed:_colorData.red/255.0 green:_colorData.green/255.0 blue:_colorData.blue/255.0 alpha:1];
	
	[_ibViewColor setBackgroundColor:color];
	
	[_ibSliderRed setMaximumValue:255];
	
	[_ibSliderRed setValue:_colorData.red];
	
	[_ibSliderGreen setMaximumValue:255];
	
	[_ibSliderGreen setValue:_colorData.green];
	
	[_ibSliderBlue setMaximumValue:255];
	
	[_ibSliderBlue setValue:_colorData.blue];
}

- (void)onColorChange {
	
	UIColor *color = [UIColor colorWithRed:_colorData.red/255.0 green:_colorData.green/255.0 blue:_colorData.blue/255.0 alpha:1];
	
	[_ibViewColor setBackgroundColor:color];
}

- (IBAction)onRedColorChange:(id)sender {
	
	_colorData.red = _ibSliderRed.value;
	
	[self onColorChange];
}

- (IBAction)onGreenColorChange:(id)sender {
	
	_colorData.green = _ibSliderGreen.value;
	
	[self onColorChange];
}

- (IBAction)onBlueColorChange:(id)sender {
	
	_colorData.blue = _ibSliderBlue.value;
	
	[self onColorChange];
}

- (IBAction)onNameChanged:(id)sender {
	
	_colorData.strName = _ibColorName.text;
	
	[_ibColorName resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	
	return YES;
}

- (void)saveColor {
	
	_colorData.strName = _ibColorName.text;
	
	[[GCColorDataMgr sharedInstance] saveColor:_colorData new:_isCreateNew];
}


@end