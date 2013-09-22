//
//  MLStopwatch.m
//  Stopwatch
//
//  Created by Matthew Loseke on 9/20/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLStopwatch.h"

@implementation MLStopwatch

@synthesize name, isStartable, timer;

- (MLStopwatch *) init
{
    self = [super init];
    [self setName:@"Stopwatch Howie Jones"];
    [self setIsStartable:YES];
    return self;
}

-(void)tick:(NSTimer *)timer
{
    // All instances of myClassA will be notified
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"timerHasTicked"
     object:self];
    
    [self incrementTickCount];
}

-(void)incrementTickCount;
{
    _timerTickCount++;
}

- (void)createScheduledTimerWithTimeInterval
{
    [self setTimer:[NSTimer scheduledTimerWithTimeInterval:0.1
     target:self
     selector:@selector(tick:)
     userInfo:nil
     repeats:YES]];
    
    [self setIsStartable:NO];
}

- (void)enableStartButton
{
    [self setIsStartable:YES];
}

- (void)disableStartButton
{
    [self setIsStartable:NO];
}

-(void)invalidate
{
    [[self timer] invalidate];
}

@end
