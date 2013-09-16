//
//  main.m
//  NumSecondsInTenYears
//
//  Created by Matthew Loseke on 9/15/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int seconds = 60;
        int minutes = 60;
        int hours = 24;
        int days = 365;
        
        int secondsInTenYears = 10 * seconds * minutes * hours * days;

        NSLog(@"There are %i seconds in 10 years\n", secondsInTenYears);
    }
    
    return 0;
}

