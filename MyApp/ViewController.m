//
//  ViewController.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "ViewController.h"
#import "GCColorDataMgr.h"
#import "GCColorListVCTL.h"
#import "GCColorEditVCTL.h"

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

- (void)gotoNextPage:(GCStoreType)storeType {
	
	[[GCColorDataMgr sharedInstance] setDataStoreType:storeType];
	
	BOOL loadSuccess = [[GCColorDataMgr sharedInstance] loadData];
	
	if (loadSuccess) {
		
		GCColorListVCTL* vctl = [[GCColorListVCTL alloc] init];
		
		[self.navigationController pushViewController:vctl animated:YES];
		
		return;
	}
	
	GCColorEditVCTL* vctl = [[GCColorEditVCTL alloc] init];
	
	[vctl setColorId:-1];
	
	[self.navigationController pushViewController:vctl animated:YES];
}

- (IBAction)objectStoreWithEncode:(id)sender {
	
	[self gotoNextPage:GCStoreType_encode];
}

- (IBAction)objectStoreWithPlist:(id)sender {
	
	[self gotoNextPage:GCStoreType_plist];
}

- (IBAction)objectStoreWithSqlite:(id)sender {
	
	[self gotoNextPage:GCStoreType_sqlite];
}

@end
