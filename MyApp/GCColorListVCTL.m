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
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onRemoveColor) name:@"colorDeleteSuccess" object:nil];
}

- (void)onRemoveColor {
	
	[_dataSource removeAllObjects];
	
	[_dataSource addObjectsFromArray:[[GCColorDataMgr sharedInstance] retriveColorData]];
	
	[_ibTableColor reloadData];
}

- (void)createColor {
	
	for (UIViewController *vctl in self.navigationController.viewControllers) {
		
		if ([vctl isKindOfClass:[GCColorEditVCTL class]]) {
			
			GCColorEditVCTL* editVCTL = (GCColorEditVCTL*)vctl;
			
			[editVCTL setColorId:-1];
			
			[self.navigationController popToViewController:vctl animated:YES];
			
			return;
		}
	}
	
	GCColorEditVCTL* vctl = [[GCColorEditVCTL alloc] init];
	
	[vctl setColorId:-1];
	
	[self.navigationController pushViewController:vctl animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	
	if (!_dataSource) {
		
		_dataSource = [[NSMutableArray alloc] init];
	}
	
	[_dataSource removeAllObjects];
	
	[_dataSource addObjectsFromArray:[[GCColorDataMgr sharedInstance] retriveColorData]];
	
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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	
	return 0.001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return _dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return 150;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (indexPath.row >= _dataSource.count) {
		
		return;
	}
	
	GCColorData* data = _dataSource[indexPath.row];
	
	[[GCColorDataMgr sharedInstance] removeColorById:data.colorId];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if (indexPath.row >= _dataSource.count) {
		
		return;
	}
	
	GCColorData* data = _dataSource[indexPath.row];
	
	GCColorEditVCTL* vctl = [[GCColorEditVCTL alloc] init];
	
	[vctl setColorId:data.colorId];
	
	[self.navigationController pushViewController:vctl animated:YES];
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

- (void)dealloc {
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end