//
//  MLStopwatch.m
//  Stopwatch
//
//  Created by Matthew Loseke on 9/20/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLStopwatch.h"

@implementation MLStopwatch

@synthesize name, isStartable, timer, tenths, seconds, minutes, hours, timerTickCount;

- (MLStopwatch *) init
{
    self = [super init];
    [self setName:@"Stopwatch Howie Jones"];
    [self setIsStartable:YES];
    return self;
}

-(void)tick:(NSTimer *)timer
{    
    // let Notification center know the timer has ticked
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"timerHasTicked"
     object:self];

    [self incrementTickCount];

    if (timerTickCount % 10 != 0) {
        tenths++;
    } else {
        tenths = 0;
    }
    
    if (timerTickCount % 10 == 0) {
        if (seconds < 59) {
            seconds++;
        } else {
            seconds = 0;
        }
    }
    
    // timer fires every tenth of a second
    // tenths/second * seconds/minute
    // 10 * 60 = 600 tenths/minute
    if (timerTickCount % 600 == 0) {
        if (minutes < 59) {
            minutes++;
        } else {
            minutes = 0;
        }
    }
    
    // tenths/second * seconds/minute * minutes/hour
    // 10 * 60 * 60 = 36,000 tenths/hour
    if (timerTickCount % 36000 == 0) {
        if (hours < 23) {
            hours++;
        } else {
            hours = 0;
        }
    }

}

-(void)incrementTickCount;
{
    timerTickCount++;
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

-(void)reset
{
    [self setTenths:0];
    [self setSeconds:0];
    [self setMinutes:0];
    [self setHours:0];
    [self setTimerTickCount:0];
}

-(void)stop
{
    [[self timer] invalidate];
    [self enableStartButton];
}

-(void)pause
{
    [[self timer] invalidate];
    [self enableStartButton];
}

-(void)start
{
    if (self.isStartable == YES) {
        [self createScheduledTimerWithTimeInterval];
    }
    // we want prevent multiple timers from running
    [self disableStartButton];
}

@end
