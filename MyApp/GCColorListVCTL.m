//
//  GCColorListVCTL.m
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCColorListVCTL.h"
#import "GCColorListCell.h"
#import "GCColorEditVCTL.h"
#import "GCColorDataMgr.h"

@interface GCColorListVCTL()

@property (nonatomic, retain) NSMutableArray* dataSource;

@end

@implementation GCColorListVCTL

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	
	return self;
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	[self setTitle:@"颜色列表"];
	
	UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithTitle:@"创建" style:UIBarButtonItemStylePlain target:self action:@selector(createColor)];
	
	self.navigationItem.rightBarButtonItem = item;
}

- (void)createColor {
	
	GCColorEditVCTL* vctl = [[GCColorEditVCTL alloc] init];
	
	[vctl setIsCreateNew:YES];
	
	[self.navigationController pushViewController:vctl animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	
	if (!_dataSource) {
		
		_dataSource = [[NSMutableArray alloc] init];
	}
	
	[_dataSource removeAllObjects];
	
	[_dataSource addObjectsFromArray:[[GCColorDataMgr sharedInstance] retriveColorData:_storeType]];
	
	[_ibTableColor reloadData];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.row >= _dataSource.count) {
		
		return nil;
	}
	
	GCColorListCell* cell = (GCColorListCell*)[self cellByClassName:@"GCColorListCell" inNib:@"GCColorListView" forTableView:tableView];
	
	[cell setColorData:_dataSource[indexPath.row]];
	
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 100;
}

- (UITableViewCell *)cellByClassName:(NSString *)className inNib:(NSString *)nibName forTableView:(UITableView *)tableView {
	
	Class cellClass = NSClassFromString(className);
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
	
	if (cell == nil) {
		
		NSArray *nib = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
		
		for (id oneObject in nib)
			if ([oneObject isMemberOfClass:cellClass])
				return oneObject;
	}
	return cell;
}

@end