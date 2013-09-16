//
//  main.m
//  CheckDayOfWeek
//
//  Created by Matthew Loseke on 9/15/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // let's let start our week out with monday being 1 and ending up with sunday being 7
        int day = 6;
        
        if ((day == 6) || (day == 7)) {
            NSLog(@"Have a nice weekend!");
        } else {
            NSLog(@"I hope you're having a good week!");
        }
        
    }
    
    return 0;
}

