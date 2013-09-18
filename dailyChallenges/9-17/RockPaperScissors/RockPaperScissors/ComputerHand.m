//
//  ComputerHand.m
//  RockPaperScissors
//
//  Created by Matthew Loseke on 9/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ComputerHand.h"

@implementation ComputerHand

- (NSString *)computerChoice
{
    NSArray *choices = @[@"rock", @"paper", @"scissors"];
    return [choices objectAtIndex:arc4random() % 3];
}

@end
