//
//  MLGame.m
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/27/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLGame.h"

@implementation MLGame

@synthesize selectionCount, selections, matchCounter, missCounter, imageNames;

- (MLGame *)init
{    
    self = [super init];
    
    selections = [[NSMutableArray alloc] initWithCapacity:2];
    selectionCount = 0;
    matchCounter = 0;
    missCounter = 0;
    [self buildImageNames];
    
    return self;
}

- (void)reset
{
    matchCounter = 0;
    missCounter = 0;
    selectionCount = 0;
    [selections removeAllObjects];
}

- (void)buildImageNames
{
    NSBundle *bundle = [[NSBundle alloc] initWithPath:@"/Users/matt/Projects/mobile-makers/dailyChallenges/9-26/ViewsAndTouches/ViewsAndTouches/assetts"];
    imageNames = [[NSMutableArray alloc] initWithObjects:@"bear", @"circular", @"clouds", @"egyptian", @"eye", @"face", @"qrcode", @"weave", nil];

    for (int i = 0; i < imageNames.count; i++) {
        NSString *path = [bundle pathForResource:[NSString stringWithFormat:@"%@", imageNames[i]] ofType:@"jpeg"];
        imageNames[i] = path;
    }
}

@end
