//
//  UIColor+ColorFromText.m
//  Color Notifications
//
//  Created by Matthew Loseke on 10/9/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "UIColor+ColorFromText.h"

@implementation UIColor (ColorFromText)

+ (UIColor *)getUIColorFromTextColor: (NSString *)color
{
   
    NSDictionary *colorDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                     [UIColor blackColor], @"black",
                                     [UIColor darkGrayColor], @"dark gray",
                                     [UIColor lightGrayColor], @"light gray",
                                     [UIColor whiteColor], @"white",
                                     [UIColor grayColor], @"gray",
                                     [UIColor redColor], @"red",
                                     [UIColor greenColor], @"green",
                                     [UIColor blueColor], @"blue",
                                     [UIColor cyanColor], @"cyan",
                                     [UIColor yellowColor], @"yellow",
                                     [UIColor magentaColor], @"magenta",
                                     [UIColor orangeColor], @"orange",
                                     [UIColor purpleColor], @"purple",
                                     [UIColor brownColor], @"brown",
                                     [UIColor clearColor], @"clear",
                                    nil];
    
    return [colorDictionary objectForKey:color];
}

@end
