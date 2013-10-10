//
//  MLUIView.m
//  Animation Hackwich
//
//  Created by Matthew Loseke on 10/10/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLPixelView.h"

@implementation MLPixelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.5f animations:^{
      
        // viewable windo
        CGSize size = self.superview.frame.size;
        float height = size.height;
        float width = size.width;
        
        // center of viewable window
        CGPoint center = CGPointMake(width / 2, height / 2);

        CGSize selfSize = self.frame.size;
        float selfHeight = selfSize.height;
        float selfWidth  = selfSize.width;
        
        float xOffset = arc4random() % ((int)width/2 - (int)selfWidth/2);
        float yOffset = arc4random() % ((int)height/2 - (int)selfHeight/2);
       
        xOffset = [self randomizeSignOfFloat:xOffset];
        yOffset = [self randomizeSignOfFloat:yOffset];
        
        float x = center.x + xOffset;
        float y = center.y + yOffset;
        
        self.center = CGPointMake(x,y);
    }];
}

- (float)randomizeSignOfFloat: (float)value
{
    int myRand = arc4random() % 10;
    if (myRand % 2 == 0) {
        value = (value * -1);
    }
    return value;
}

@end
