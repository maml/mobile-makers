//
//  MLTimer.m
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/27/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLTimer.h"

@implementation MLTimer

@synthesize seconds, minutes, timer;


- (MLTimer *)init
{
    self = [super init];

    timer = [NSTimer scheduledTimerWithTimeInterval:1
        target:self
        selector:@selector(tick)
        userInfo:nil
        repeats:YES];

    return self;
}

- (void)tick
{
    //NSLog(@"tick from Timer class");
}

@end
