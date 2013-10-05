//
//  DGRange.m
//  daniel.garcia.BMIcalculator
//
//  Created by Campus User on 10/4/13.
//  Copyright (c) 2013 Campus User. All rights reserved.
//

#import "DGRange.h"

@implementation DGRange

- (id) initWithLowBound: (double)lB andHighBound: (double) hB {
    self._lowBound = [NSNumber numberWithDouble:lB];
    self._highBound = [NSNumber numberWithDouble:hB];
    return self;
}

- (bool) doubleInRange: (double)num {
    return ( num > [self._lowBound doubleValue] &&
             num < [self._highBound doubleValue] );
}

@end
