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

@synthesize colorPanelViews, cpuSequence;

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self storeColorPanelInstancesInDictionary];
    [self setDelegateOnColorPanelInstancesToSelf];
    
    _i = 1;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(tick) userInfo:nil repeats:YES];

    cpuSequence = [self generatedSequence];
    _playerTouchCount = 0;
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

    (_i > [colorPanelViews allValues].count) ? [_timer invalidate] : _i++;
}

// ---------------------- Game Event and Handlers -----------------------------

# pragma ColorPanelDelegate method
-(void)didTouchColorPanelView: (int)tagNumber
{
    (tagNumber == [[cpuSequence objectAtIndex:_playerTouchCount] integerValue]) ? [self didTouchCorrectColorPanelView] : [self didTouchIncorrectColorPanelView];
}

- (void)didTouchCorrectColorPanelView
{
    NSLog(@"correct touch");
    _playerTouchCount++;
}

- (void)didTouchIncorrectColorPanelView
{
    NSLog(@"incorrect touch - Game Over");
}

// --------------------- Game Setup -------------------------------------------

- (NSMutableArray *)generatedSequence
{
    NSMutableArray *sequence = [[NSMutableArray alloc] init];

    for (int i = 0; i < [colorPanelViews allValues].count; i++) {
        int integer = arc4random() % ([colorPanelViews allValues].count + 1);
        NSString *integerToString = [NSString stringWithFormat:@"%i", integer];
        [sequence addObject:integerToString];
    }
    
    return sequence;
}

@end








