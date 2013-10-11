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
    [super viewDidLoad];
   
    [self storeColorPanelInstancesInDictionary];
    [self setDelegateOnColorPanelInstancesToSelf];
    
    _i = 1;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

/*
 Store each instance of this controller's MLColorPanelView's in a mutable dictionary, _views.
 Each view's key will be a string representation of its tag property.
*/
- (void)storeColorPanelInstancesInDictionary
{
    _views = [[NSMutableDictionary alloc] init];
    
    for (MLColorPanelView *view in self.view.subviews) {
   
        if ([view isKindOfClass:[MLColorPanelView class]]) {
            
            [_views setObject:view forKey:[NSString stringWithFormat:@"%i", view.tag]];
            
        }
    }
}

/*
 Enumerate through each view in the dictionary and assign this instance of MLViewController as the view's delegate.
 (remember: the dictionary contains instances of MLColorPanelView)
*/
- (void)setDelegateOnColorPanelInstancesToSelf
{
    [_views enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        // Why is typecasting necessary here? Logging each obj shows them to be instances of MLColorPanelView
        // NSLog(@"obj is: %@", obj);
        ((MLColorPanelView *)obj).delegate = self;
    }];
}

- (void)tick
{
    MLColorPanelView *view = [_views objectForKey:[NSString stringWithFormat:@"%i", _i]];
    UIColor *prevColor = [view backgroundColor];

    [UIView animateWithDuration:0.2f animations:^{
         [view setBackgroundColor:[UIColor redColor]];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2f animations:^{
            [view setBackgroundColor:prevColor];
        }];
    }];
    
    if (_i > [_views allValues].count) {
        _i = 0;
        [_timer invalidate];
    } else {
        _i++;
    }
}

-(void)didTouchColorPanelView: (int)tagNumber
{
    NSLog(@"tagNumber is: %i", tagNumber);
}

@end
