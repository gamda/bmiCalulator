//
//  DGRange.h
//  daniel.garcia.BMIcalculator
//
//  Created by Campus User on 10/4/13.
//  Copyright (c) 2013 Campus User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGRange : NSObject

@property (retain, nonatomic) NSNumber* _lowBound;
@property (retain, nonatomic) NSNumber* _highBound;

+ (DGRange*) initWithLowBound: (double)lB andHighBound: (double) hB;
- (bool) doubleInRange: (double)num;

@end
