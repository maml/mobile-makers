//
//  Judge.m
//  RockPaperScissors
//
//  Created by Dylan Baumann on 9/17/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "Judge.h"

@implementation Judge

-(BOOL)didComputerWin: (NSString *)computerString userString:(NSString *)userString;
{
    BOOL won = YES;

    if ([computerString isEqualToString:userString])
    {
        won = NO;
    } else if ([computerString isEqualToString:@"rock"] && [userString isEqualToString:@"scissors"])
    {
        won = YES;
    } else if ([computerString isEqualToString:@"rock"] && [userString isEqualToString:@"paper"])
    {
        won = NO;
    } else if ([computerString isEqualToString:@"scissors"] && [userString isEqualToString:@"rock"])
    {
        won = NO;
    } else if ([computerString isEqualToString:@"scissors"] && [userString isEqualToString:@"paper"])
    {
        won = YES;
    } else if ([computerString isEqualToString:@"paper"] && [userString isEqualToString:@"rock"])
    {
        won = YES;
    } else if ([computerString isEqualToString:@"paper"] && [userString isEqualToString:@"scissors"])
    {
        won = NO;
    }

    return won;
}


@end
