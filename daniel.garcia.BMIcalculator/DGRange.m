//
//  DGRange.m
//  daniel.garcia.BMIcalculator
//
//  Created by Campus User on 10/4/13.
//  Copyright (c) 2013 Campus User. All rights reserved.
//

#import "DGRange.h"

@implementation DGRange

+ (DGRange*) initWithLowBound: (double)lB andHighBound: (double) hB {
    DGRange* new = [[DGRange alloc] init];
    new._lowBound = [NSNumber numberWithDouble:lB];
    new._highBound = [NSNumber numberWithDouble:hB];
    return new;
}

- (bool) doubleInRange: (double)num {
    return ( num > [self._lowBound doubleValue] &&
             num < [self._highBound doubleValue] );
}

@end
