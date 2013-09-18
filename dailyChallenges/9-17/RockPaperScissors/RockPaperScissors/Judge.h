//
//  Judge.h
//  RockPaperScissors
//
//  Created by Dylan Baumann on 9/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Judge : NSObject

-(BOOL)didComputerWin: (NSString *)computerString userString:(NSString *)userString;

@end
