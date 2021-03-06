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

@synthesize game, colorPanelViews, currentScore, lives, level;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self storeColorPanelInstancesInDictionary];
    [self setDelegateOnColorPanelInstancesToSelf];

    self.game = [[MLGame alloc] initWithCpuSequence];
    game.delegate = self;
    
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
    if (_i < game.sequenceLength) {
        NSString *tagNumber = [game.cpuSequence  objectAtIndex:_i];
        MLColorPanelView *view = [colorPanelViews objectForKey:tagNumber];
        [view animateToClearAndBack];
        _i++;
    } else {
        [_timer invalidate];
    }
    }

# pragma GameEventsDelegate
- (void)scoreDidChange:(int)score
{
    NSLog(@"scoreDidUpdate has fired in view controller with score of: %i", score);
    currentScore.text = [NSString stringWithFormat:@"%i", score];
}

- (void)numberOfLivesDidChange:(int)_lives
{
    lives.text = [NSString stringWithFormat:@"%i", _lives];
}

- (void)levelDidChange:(int)_level
{
    NSLog(@"levelDidChange has fired");
    level.text = [NSString stringWithFormat:@"%i", _level];
}

# pragma ColorPanelDelegate
-(void)didTouchColorPanelView: (int)tagNumber
{
    (tagNumber == [[game.cpuSequence objectAtIndex:game.playerTouchCount] integerValue]) ? [self didTouchCorrectColorPanelView] : [self didTouchIncorrectColorPanelView];
}

- (void)didTouchCorrectColorPanelView
{
    [game handleCorrectTouch];
}

- (void)didTouchIncorrectColorPanelView
{
    [game handleIncorrectTouch];
}

@end








