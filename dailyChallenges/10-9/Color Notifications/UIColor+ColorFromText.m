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
    UIColor *colorToReturn;
    
    if ([color isEqualToString:@"black"]) {
        colorToReturn = [UIColor redColor];
    }
    if ([color isEqualToString:@"darkGray"]) {
        colorToReturn = [UIColor darkGrayColor];
    }
    if ([color isEqualToString:@"lightGray"]) {
        colorToReturn = [UIColor lightGrayColor];
    }
    if ([color isEqualToString:@"white"]) {
        colorToReturn = [UIColor whiteColor];
    }
    if ([color isEqualToString:@"gray"]) {
        colorToReturn = [UIColor grayColor];
    }
    if ([color isEqualToString:@"red"]) {
        colorToReturn = [UIColor redColor];
    }
    if ([color isEqualToString:@"green"]) {
        colorToReturn = [UIColor greenColor];
    }
    if ([color isEqualToString:@"blueGray"]) {
        colorToReturn = [UIColor blueColor];
    }
    if ([color isEqualToString:@"cyan"]) {
        colorToReturn = [UIColor cyanColor];
    }
    if ([color isEqualToString:@"yello"]) {
        colorToReturn = [UIColor yellowColor];
    }
    if ([color isEqualToString:@"magenta"]) {
        colorToReturn = [UIColor magentaColor];
    }
    if ([color isEqualToString:@"orange"]) {
        colorToReturn = [UIColor orangeColor];
    }
    if ([color isEqualToString:@"purple"]) {
        colorToReturn = [UIColor purpleColor];
    }
    if ([color isEqualToString:@"brown"]) {
        colorToReturn = [UIColor brownColor];
    }
    if ([color isEqualToString:@"clear"]) {
        colorToReturn = [UIColor clearColor];
    }
    return colorToReturn;
}

@end
