//
//  MLTimer.m
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/27/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLTimer.h"

@implementation MLTimer

@synthesize seconds, minutes, timer, delegate, tickCounter;

- (MLTimer *)initWithDelegate: (id)controller andTimeInSeconds:(int)timeInSeconds
{
    /*
     Setting the passed in controller instance as the delegate when initializing
     allows us to set up the initial timer values in the interface
    */
    self = [super init];
    timer = [self setUpTimer:timeInSeconds];
    delegate = controller;
    [delegate displayInitialTimeValues:minutes seconds:seconds];
    return self;
}

- (NSTimer *)setUpTimer: (int)timeInSeconds
{
    // 1 tick = 1 second
    tickCounter = timeInSeconds;
    
    [self setMinutesAndSeconds];
    
    return [NSTimer scheduledTimerWithTimeInterval:1
        target:self
        selector:@selector(tick)
        userInfo:nil
        repeats:YES];
}

- (int)setMinutes
{
    minutes = tickCounter / 60;
    return minutes;
}

- (int)setSeconds
{
    seconds = tickCounter % 60;
    return seconds;
}

- (void)setMinutesAndSeconds
{
    [self setMinutes];
    [self setSeconds];
}

- (void)tick
{
    tickCounter--;
    [self setMinutesAndSeconds];

    if (tickCounter == 0)
    {
        seconds = tickCounter % 60;
        [timer invalidate];
    } else {
        minutes = tickCounter / 60;
        seconds = tickCounter % 60;
    }

    [delegate timerDidTick: minutes seconds:seconds];
}

@end
