//
//  MLGame.m
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/27/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLGame.h"

@implementation MLGame

@synthesize selectionCount, selections, matchCounter, missCounter;

- (MLGame *)init
{    
    self = [super init];
    
    selections = [[NSMutableArray alloc] initWithCapacity:2];
    selectionCount = 0;
    matchCounter = 0;
    missCounter = 0;
    
    return self;
}

- (void)reset
{
    matchCounter = 0;
    missCounter = 0;
    selectionCount = 0;
    [selections removeAllObjects];
}

@end
