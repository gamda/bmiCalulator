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
}

- (IBAction)switchChanged:(id)sender {
    self.metricSystem = !self.metricSystem;
    
    if (self.metricSystem) {
        self.lblHeight.text = @"cm";
        self.lblWeight.text = @"Kg";
    }
    else {
        self.lblHeight.text = @"in";
        self.lblWeight.text = @"lb";
    }
}

@end
