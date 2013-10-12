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

@synthesize colorPanelViews;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self storeColorPanelInstancesInDictionary];
    [self setDelegateOnColorPanelInstancesToSelf];
    
    _i = 1;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

/*
 Store each instance of this controller's MLColorPanelView's in a mutable dictionary, colorPanelViews.
 Each view's key will be a string representation of its tag property.
*/
- (void)storeColorPanelInstancesInDictionary
{
    colorPanelViews = [[NSMutableDictionary alloc] init];
    
    for (MLColorPanelView *view in self.view.subviews) {
   
        if ([view isKindOfClass:[MLColorPanelView class]]) {
            
            [colorPanelViews setObject:view forKey:[NSString stringWithFormat:@"%i", view.tag]];
            
        }
    }
}

/*
 Enumerate views in the dictionary and assign (this instance of) MLViewController as the views' delegate.
 (remember: the dictionary contains instances of MLColorPanelView)
*/
- (void)setDelegateOnColorPanelInstancesToSelf
{
    [colorPanelViews enumerateKeysAndObjectsUsingBlock:^(id key, MLColorPanelView *view, BOOL *stop) {
        view.delegate = self;
    }];
}

- (void)tick
{
    MLColorPanelView *view = [colorPanelViews objectForKey:[NSString stringWithFormat:@"%i", _i]];
    [view animateToWhiteAndBack];
    
    if (_i > [colorPanelViews allValues].count) {
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
