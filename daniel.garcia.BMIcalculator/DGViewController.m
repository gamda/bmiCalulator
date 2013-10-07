//
//  DGViewController.m
//  daniel.garcia.BMIcalculator
//
//  Created by Campus User on 10/4/13.
//  Copyright (c) 2013 Campus User. All rights reserved.
//

#import "DGViewController.h"

@interface DGViewController ()
{
    BOOL _metricSystem;
}
@property (assign) BOOL metricSystem;
@end

@implementation DGViewController

@synthesize metricSystem = _metricSystem;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ( ! [self isFirstResponder]) {
        if ([self.textWeight isFirstResponder]) {
            [self.textWeight resignFirstResponder];
        }
        if ([self.textHeight isFirstResponder]) {
            [self.textHeight resignFirstResponder];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.metricSystem = self.metricSwitch.on;
    self.imgResult.hidden = true;
    self.imgArrow.hidden = true;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCalculate:(id)sender {
    double height, weight, bmi;
    if (self.metricSystem) {
        // get values from textfields
        height = [self.textHeight.text doubleValue] / 100;
        weight = [self.textWeight.text doubleValue];
    }
    else {
        // convert values from textfields to correct units
        height = [self inToCm:[self.textHeight.text doubleValue]] / 100;
        weight = [self lbToKg:[self.textWeight.text doubleValue]];
    }
    bmi = weight / (height * height);
    self.lblBMI.text = [NSString stringWithFormat:@"Your BMI: %.2f",bmi];
    self.lblBMI.hidden = false;
    
    // picture
    if( bmi > 0 && bmi < 18.5) {
        [self.imgArrow setFrame:CGRectMake(25, 253,
                                           self.imgArrow.frame.size.width,
                                           self.imgArrow.frame.size.height)];
    }
    else if (bmi >= 18.5 && bmi < 25 ) {
        [self.imgArrow setFrame:CGRectMake(25, 277,
                                           self.imgArrow.frame.size.width,
                                           self.imgArrow.frame.size.height)];
    }
    else if (bmi >= 25 && bmi < 30) {
        [self.imgArrow setFrame:CGRectMake(25, 301,
                                           self.imgArrow.frame.size.width,
                                           self.imgArrow.frame.size.height)];
    }
    else if (bmi >= 30 && bmi < 35) {
        [self.imgArrow setFrame:CGRectMake(25, 325,
                                           self.imgArrow.frame.size.width,
                                           self.imgArrow.frame.size.height)];
    }
    else if (bmi >= 35 && bmi < 40) {
        [self.imgArrow setFrame:CGRectMake(25, 342,
                                           self.imgArrow.frame.size.width,
                                           self.imgArrow.frame.size.height)];
    }
    else { // >40
        [self.imgArrow setFrame:CGRectMake(25, 365,
                                           self.imgArrow.frame.size.width,
                                           self.imgArrow.frame.size.height)];
    }
    self.imgResult.hidden = false;
    self.imgArrow.hidden = false;
    
    // hide keyboard to reveal image
    if ([self.textWeight isFirstResponder]) {
        [self.textWeight resignFirstResponder];
    }
    if ([self.textHeight isFirstResponder]) {
        [self.textHeight resignFirstResponder];
    }
}

- (IBAction)switchChanged:(id)sender {
    self.metricSystem = !self.metricSystem;
    
    if (self.metricSystem) {
        self.lblHeight.text = @"cm";
        self.lblWeight.text = @"Kg";
        // Height
        NSNumber* prevHeight = [NSNumber numberWithDouble:[self.textHeight.text doubleValue]];
        double newHeight = [self inToCm:[prevHeight doubleValue]];
        self.textHeight.text = [NSString stringWithFormat:@"%.2f",newHeight];
        // Weight
        NSNumber* prevWeight = [NSNumber numberWithDouble:[self.textWeight.text doubleValue]];
        double newWeight = [self lbToKg:[prevWeight doubleValue]];
        self.textWeight.text = [NSString stringWithFormat:@"%.2f",newWeight];
    }
    else {
        self.lblHeight.text = @"in";
        self.lblWeight.text = @"lb";
        // Height
        NSNumber* prevHeight = [NSNumber numberWithDouble:[self.textHeight.text doubleValue]];
        double newHeight = [self cmToIn:[prevHeight doubleValue]];
        self.textHeight.text = [NSString stringWithFormat:@"%.2f",newHeight];
        // Weight
        NSNumber* prevWeight = [NSNumber numberWithDouble:[self.textWeight.text doubleValue]];
        double newWeight = [self KgToLb:[prevWeight doubleValue]];
        self.textWeight.text = [NSString stringWithFormat:@"%.2f",newWeight];
    }
}

- (double)inToCm: (double)qty {
    return qty * 2.54;
}

- (double)cmToIn: (double)qty {
    return qty / 2.54;
}

- (double)lbToKg: (double)qty {
    return qty * .454;
}

- (double)KgToLb: (double)qty {
    return qty / .454;
}

@end
