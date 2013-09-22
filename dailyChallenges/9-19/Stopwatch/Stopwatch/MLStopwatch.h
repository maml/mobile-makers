//
//  MLStopwatch.h
//  Stopwatch
//
//  Created by Matthew Loseke on 9/20/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLStopwatch : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) BOOL isStartable;
@property (strong, nonatomic) NSTimer *timer;
@property int timerTickCount;

- (void)createScheduledTimerWithTimeInterval;
- (void)enableStartButton;
- (void)disableStartButton;
- (void)tick:(NSTimer *)timer;
- (void)incrementTickCount;
- (void)invalidate;

@property (nonatomic) int tenths;
@property (nonatomic) int seconds;
@property (nonatomic) int minutes;
@property (nonatomic) int hours;


@end
