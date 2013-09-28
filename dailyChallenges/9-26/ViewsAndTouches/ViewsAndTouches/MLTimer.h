//
//  MLTimer.h
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/27/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLTimer : NSObject

@property int seconds;
@property int minutes;
@property (strong, nonatomic) NSTimer *timer;

@end
