//
//  MLGame.m
//  Simon Says
//
//  Created by Matthew Loseke on 10/13/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLGame.h"

@implementation MLGame

@synthesize cpuSequence, playerTouchCount;

- (id)initWithCpuSequenceWithLength: (int)length
{
    self = [super init];
    
    if (self) {
        [self generateSequenceWithLength: 6];
        playerTouchCount = 0;
    }
    
    return self;
}

- (void)generateSequenceWithLength: (int)length
{
    cpuSequence = [[NSMutableArray alloc] init];

    for (int i = 0; i < length; i++) {
        int integer = (arc4random() % length) + 1;
        NSString *integerToString = [NSString stringWithFormat:@"%i", integer];
        [cpuSequence addObject:integerToString];
    }
}
@end
