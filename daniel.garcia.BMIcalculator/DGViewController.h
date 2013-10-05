//
//  DGViewController.h
//  daniel.garcia.BMIcalculator
//
//  Created by Campus User on 10/4/13.
//  Copyright (c) 2013 Campus User. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textWeight;
@property (weak, nonatomic) IBOutlet UITextField *textHeight;
@property (weak, nonatomic) IBOutlet UISwitch *switchSystem;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblHeight;
@property (weak, nonatomic) IBOutlet UISwitch *metricSwitch;

- (IBAction)btnCalculate:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (double)inToCm: (double)qty;
- (double)cmToIn: (double)qty;
- (double)lbToKg: (double)qty;
- (double)KgToLb: (double)qty;

@end
