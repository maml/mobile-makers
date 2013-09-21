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

- (void)createScheduledTimerWithTimeInterval;
- (void)enableStartButton;
- (void)disableStartButton;
- (void)notify:(NSTimer *)timer;
- (void)invalidate;

@end
