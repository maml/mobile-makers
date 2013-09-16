//
//  main.m
//  HurricaneCategory
//
//  Created by Matthew Loseke on 9/15/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
          
        int HurricaneCategory = 2;
        
        switch (HurricaneCategory) {
            case 1:
                NSLog(@"Hurricane is a category 1");
                break;
            case 2:
                NSLog(@"Hurricane is a category 2");
                break;
            case 3:
                NSLog(@"Hurricane is a category 3");
                break;
            case 4:
                NSLog(@"Hurricane is a category 4");
                break;
            case 5:
                NSLog(@"Hurricane is a category 5");
                break;
            default:
                break;
        }

    }
    return 0;
}

