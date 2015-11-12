//
//  ViewController.h
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton* ibBtnEncode;
@property (nonatomic, retain) IBOutlet UIButton* ibBtnPlist;
@property (nonatomic, retain) IBOutlet UIButton* ibBtnSqlite;

- (IBAction)objectStoreWithEncode:(id)sender;

- (IBAction)objectStoreWithPlist:(id)sender;

- (IBAction)objectStoreWithSqlite:(id)sender;

@end

