//
//  MLUIColorView.m
//  Color Notifications
//
//  Created by Matthew Loseke on 10/9/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLUIColorView.h"

@interface MLUIColorView () {
    id observer;
}
@end

@implementation MLUIColorView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        observer = [nc addObserverForName:@"Time to change the color" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
           
            // grab the instance of UITextField passed when this notification was fired
            UITextField *textField = note.object;
            
            // and its text attribute so we can pass it on
            NSString *text = textField.text;
            
            // now, call our newColorWithNotification and pass that color as its param
            [self newColorWithNotification:text];
        }];
    }
    
    return self;
}

- (void)newColorWithNotification: (NSString *)color
{
    [self setBackgroundColor:[self getUIColorFromTextColor:color]];
}

- (UIColor *)getUIColorFromTextColor: (NSString *)color
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







