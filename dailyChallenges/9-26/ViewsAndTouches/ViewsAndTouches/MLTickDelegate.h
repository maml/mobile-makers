//
//  MLTickDelegate.h
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/28/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MLTickDelegate <NSObject>

- (void)displayInitialTimeValues: (int)minutes seconds:(int)seconds;
- (void)timerDidTick: (int)minutes seconds:(int)seconds;

@end