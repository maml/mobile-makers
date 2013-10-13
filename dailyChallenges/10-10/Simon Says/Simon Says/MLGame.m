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

- (id)initWithCpuSequence
{
    self = [super init];
    
    if (self) {
        [self generateSequence];
        playerTouchCount = 0;
    }
    
    return self;
}

- (void)generateSequence
{
    cpuSequence = [[NSMutableArray alloc] init];
    for (int i = 0; i < 6; i++) {
        int integer = (arc4random() % 6) + 1;
        NSString *integerToString = [NSString stringWithFormat:@"%i", integer];
        [cpuSequence addObject:integerToString];
    }
    NSLog(@"cpuSequence is: %@", cpuSequence);
}
@end
