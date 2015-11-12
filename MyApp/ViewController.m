//
//  ViewController.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "ViewController.h"
#import "GCColorListVCTL.h"
#import "GCColorDataMgr.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)setButtnStytle:(UIButton*)btn {
	
	[btn.layer setCornerRadius:8.0]; //设置矩圆角半径
	
	[btn.layer setBorderWidth:1.0];   //边框宽度
	
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	
	CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 0, 0, 1 });
	
	[btn.layer setBorderColor:colorref];//边框颜色
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	[self setButtnStytle:_ibBtnEncode];
	
	[self setButtnStytle:_ibBtnPlist];
	
	[self setButtnStytle:_ibBtnSqlite];
}

- (IBAction)objectStoreWithEncode:(id)sender {
	
	GCColorListVCTL* vctl = [[GCColorListVCTL alloc] init];
	
	[[GCColorDataMgr sharedInstance] loadData:GCColorStoreType_encode];
	
	[self.navigationController pushViewController:vctl animated:YES];
}

- (IBAction)objectStoreWithPlist:(id)sender {
	
	GCColorListVCTL* vctl = [[GCColorListVCTL alloc] init];
	
	[[GCColorDataMgr sharedInstance] loadData:GCColorStoreType_plist];
	
	[self.navigationController pushViewController:vctl animated:YES];
}

- (IBAction)objectStoreWithSqlite:(id)sender {
	
	GCColorListVCTL* vctl = [[GCColorListVCTL alloc] init];
	
	[[GCColorDataMgr sharedInstance] loadData:GCColorStoreType_sqlite];
	
	[self.navigationController pushViewController:vctl animated:YES];
}

@end
