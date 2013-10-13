//
//  MLColorPanelView.m
//  Simon Says
//
//  Created by Matthew Loseke on 10/10/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLColorPanelView.h"

@implementation MLColorPanelView

@synthesize delegate, color;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [delegate didTouchColorPanelView: self.tag];
    self.alpha = 0.5f;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.alpha = 1.0f;
}

- (void)animateToClearAndBack
{
    UIColor *prevColor = [self backgroundColor];
    
    [UIView animateWithDuration:0.15f animations:^{
        [self setBackgroundColor:[UIColor clearColor]];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15f animations:^{
            [self setBackgroundColor:prevColor];
        }];
    }];
}

@end
