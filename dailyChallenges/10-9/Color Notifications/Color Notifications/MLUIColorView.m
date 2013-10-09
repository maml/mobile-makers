//
//  MLUIColorView.m
//  Color Notifications
//
//  Created by Matthew Loseke on 10/9/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLUIColorView.h"
#import "UIColor+ColorFromText.h"

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
    [self setBackgroundColor:[UIColor getUIColorFromTextColor:color]];
}

@end







