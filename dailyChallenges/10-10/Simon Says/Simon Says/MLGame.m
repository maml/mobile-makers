//
//  MLGame.m
//  Simon Says
//
//  Created by Matthew Loseke on 10/13/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLGame.h"

@implementation MLGame

@synthesize cpuSequence, playerTouchCount, level, sequenceLength;

- (id)initWithCpuSequence
{
    self = [super init];
    
    if (self) {
        // we have the game start at level 1 and set the length of cpuSequence to two times the current level
        level = 1;
        [self generateSequenceWithLength: level * 2];
        playerTouchCount = 0;
    }
    
    return self;
}

- (void)generateSequenceWithLength: (int)length
{
    cpuSequence = [[NSMutableArray alloc] init];

    for (int i = 0; i < length; i++) {
        // since there are no color panels with tag 0 we bump the result up by 1 to ensure the returned value matches a color panel tag
        int integer = (arc4random() % length) + 1;
        NSString *integerToString = [NSString stringWithFormat:@"%i", integer];
        [cpuSequence addObject:integerToString];
    }
    
    sequenceLength = cpuSequence.count;
}
@end
