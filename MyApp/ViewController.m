//
//  ViewController.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import "ViewController.h"
#import "GCColorListVCTL.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)objectStoreWithEncode:(id)sender {
	
	GCColorListVCTL* vctl = [[GCColorListVCTL alloc] init];
	
	[self.navigationController pushViewController:vctl animated:YES];
}

- (IBAction)objectStoreWithPlist:(id)sender {
	
	
}

- (IBAction)objectStoreWithSqlite:(id)sender {
	
	
}

@end
