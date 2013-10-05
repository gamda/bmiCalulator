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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.metricSystem = self.metricSwitch.on;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnCalculate:(id)sender {
    double height, weight, bmi;
    if (self.metricSystem) {
        // calculate
        height = [self.textHeight.text doubleValue] / 100;
        weight = [self.textWeight.text doubleValue];
    }
    else {
        // convert and then calculate
        height = [self inToCm:[self.textHeight.text doubleValue]] / 100;
        weight = [self lbToKg:[self.textWeight.text doubleValue]];
    }
    bmi = weight / (height * height);
    NSLog(@"height %f, weight %f, bmi %f", height, weight, bmi);
    self.lblBMI.text = [NSString stringWithFormat:@"%.2f",bmi];
    self.lblBMI.hidden = false;
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
