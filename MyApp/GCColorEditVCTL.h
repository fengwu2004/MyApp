//
//  GCColorEditVCTL.h
//  MyApp
//
//  Created by user on 15/11/12.
//  Copyright © 2015年 user. All rights reserved.
//

#ifndef GCColorEditVCTL_h
#define GCColorEditVCTL_h

#import <UIKit/UIKit.h>
#import "GCColorDefine.h"

@interface GCColorEditVCTL : UIViewController

@property (nonatomic, retain) IBOutlet UIView* ibViewColor;
@property (nonatomic, retain) IBOutlet UITextField* ibColorName;
@property (nonatomic, retain) IBOutlet UISlider* ibSliderRed;
@property (nonatomic, retain) IBOutlet UISlider* ibSliderGreen;
@property (nonatomic, retain) IBOutlet UISlider* ibSliderBlue;

@property (nonatomic, retain) IBOutlet UILabel* ibLabelRed;
@property (nonatomic, retain) IBOutlet UILabel* ibLabelGreen;
@property (nonatomic, retain) IBOutlet UILabel* ibLabelBlue;



@property (nonatomic, assign) NSInteger colorId;

- (IBAction)onRedColorChange:(id)sender;
- (IBAction)onGreenColorChange:(id)sender;
- (IBAction)onBlueColorChange:(id)sender;
- (IBAction)onNameChanged:(id)sender;

@end

#endif /* GCColorEditVCTL_h */
