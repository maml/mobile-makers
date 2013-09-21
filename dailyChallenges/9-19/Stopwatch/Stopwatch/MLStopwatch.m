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

-(void)notify:(NSTimer *)timer
{
    // All instances of myClassA will be notified
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"tick"
     object:self];
}

- (void)createScheduledTimerWithTimeInterval
{
    [self setTimer:[NSTimer scheduledTimerWithTimeInterval:0.1
                                                    target:self
                                                  selector:@selector(notify:)
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
