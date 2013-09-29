//
//  MLTimer.h
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/27/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLTickDelegate.h"

@interface MLTimer : NSObject

@property (strong, nonatomic) id<MLTickDelegate> delegate;

- (MLTimer *)initWithDelegate: (id)controller andTimeInSeconds:(int)timeInSeconds;

@property (strong, nonatomic) NSTimer *timer;
@property int tickCounter;
@property int seconds;
@property int minutes;

@end
