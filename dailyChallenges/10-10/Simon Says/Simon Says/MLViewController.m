//
//  MLViewController.m
//  Simon Says
//
//  Created by Matthew Loseke on 10/10/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLColorPanelView.h"

@implementation MLViewController

- (void)viewDidLoad
{
    _i = 1;
    _views = [[NSMutableDictionary alloc] init];
    
    [super viewDidLoad];
    
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[MLColorPanelView class]]) {
            [_views setObject:view forKey:[NSString stringWithFormat:@"%i", view.tag]];
        }
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (void)tick
{
    MLColorPanelView *view = [_views objectForKey:[NSString stringWithFormat:@"%i", _i]];

    UIColor *prevColor = [view backgroundColor];
    NSLog(@"prevColor is: %@", prevColor);

    [view setBackgroundColor:[UIColor whiteColor]];
    
    [UIView animateWithDuration:0.2f animations:^{
         [view setBackgroundColor:[UIColor redColor]];
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2f animations:^{
            [view setBackgroundColor:prevColor];
        }];
    }];
    
    if (_i == 6) {
        _i = 0;
        [_timer invalidate];
        NSLog(@"timer is done!!!");
    } else {
        _i++;
    }
}

@end
