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

@synthesize game, colorPanelViews;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.game = [[MLGame alloc] initWithCpuSequence];
    
    [self storeColorPanelInstancesInDictionary];
    [self setDelegateOnColorPanelInstancesToSelf];

    // move to MLGame
    _playerTouchCount = 0;
  
    // Used to animate through the instances of MLColorPanelView as they "appear" in game.cpuSequence
    // _i keeps track of ticks
    _i = 0;
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
    if (_i < [colorPanelViews allValues].count) {
        NSString *tagNumber = [game.cpuSequence  objectAtIndex:_i];
        MLColorPanelView *view = [colorPanelViews objectForKey:tagNumber];
        [view animateToClearAndBack];
        _i++;
    } else {
        [_timer invalidate];
    }
}

# pragma ColorPanelDelegate
-(void)didTouchColorPanelView: (int)tagNumber
{
    (tagNumber == [[game.cpuSequence objectAtIndex:_playerTouchCount] integerValue]) ? [self didTouchCorrectColorPanelView] : [self didTouchIncorrectColorPanelView];
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

@end








