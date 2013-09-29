//
//  MLViewController.m
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/26/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#define DEFAULT  [UIColor lightGrayColor]
#define SELECTED [UIColor orangeColor]
#define TOUCHED SELECTED
#define MATCHED  [UIColor greenColor]

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize game, mlt;

- (void)viewDidLoad
{
    [super viewDidLoad];

    game = [[MLGame alloc] init];
    mlt = [[MLTimer alloc] initWithDelegate:self andTimeInSeconds:60];

    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[MLmyView class]])
        {
            MLmyView *myView = (MLmyView *) view;
            myView.delegate = self;
            myView.state = YES;
        }
    }
}

- (void)displayInitialTimeValues: (int)minutes seconds:(int)seconds
{
    [self updateMinutesLabel:minutes];
    [self updateSecondsLabel:seconds];
}

- (void)timerDidTick: (int)minutes seconds:(int)seconds
{
    [self updateSecondsLabel:seconds];
    [self updateMinutesLabel:minutes];
}

- (void)updateSecondsLabel: (int)seconds
{
    if (seconds == 0) {
        _secondsLabel.text = @"00";
    } else if (seconds < 10) {
        _secondsLabel.text = [NSString stringWithFormat:@"0%i", seconds];
    } else {
        _secondsLabel.text = [NSString stringWithFormat:@"%i", seconds];
    }
}

- (void)updateMinutesLabel: (int)minutes
{
    _minutesLabel.text = [NSString stringWithFormat:@"%i", minutes];
}

// view is playable if its state is `on` ie, YES
- (BOOL)viewIsPlayable: (MLmyView *)view
{
    if (view.state == YES)
    {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)itsTimeToCompareViews
{
    if (game.selectionCount %2 == 0)
    {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)compareViews
{
    MLmyView *view1 = game.selections[0];
    MLmyView *view2 = game.selections[1];
    return view1.tag == view2.tag;
}

- (void)setViewBackgroundsTo: (UIColor *)color
{
    for (MLmyView *view in game.selections)
    {
        view.backgroundColor = color;
    }
}

- (void)setPlayabilityOfSelectedViews: (BOOL)state
{
    for (MLmyView *view in game.selections)
    {
        view.state = state;
    }
}

- (void)takeViewOutOfPlay: (MLmyView *)view
{
    view.state = NO;
}

- (void)resetSelectionsArray
{
    [game.selections removeAllObjects];
}

- (void)resetIfGameHasBeenWon
{
    if (game.matchCounter == 8)
    {
        [self resetGame];
    }
}

- (void)resetGame
{
    [self resetUI];
    [game reset];
}

- (void)resetUI
{
    // set each view's color back to default and their state to playable
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[MLmyView class]])
        {
            MLmyView *myView = (MLmyView *) view;
            myView.backgroundColor = DEFAULT;
            myView.state = YES;
        }
    }
    // update the matches and misses labels
    _matchesLabel.text = @"Matches:";
    _missesLabel.text = @"Misses:";
}

- (void)updateLabel: (NSString *)label
{
    if ([label isEqual: @"matches"])
    {
        _matchesLabel.text = [NSString stringWithFormat:@"Matches: %i", game.matchCounter];
    } else {
        _missesLabel.text = [NSString stringWithFormat:@"Misses: %i", game.missCounter];
    }
}

- (void)didTouchView:(UIView *)view
{
    if ([self viewIsPlayable:(MLmyView *)view]) {
        view.backgroundColor = TOUCHED;
    }
}

- (void)didChooseView:(MLmyView *)view
{
    
    /* -------------------------------------------------------------------------------

    Is the touched view playable? If so we neet to:

        - increment selectionCount.
        - set its background to SELECTED
        - add view to selections array
        - take it out of play

        If it's time to compare . . .

            If the views' tags are not equal we need to:
             
                - update the misses counter
                - restore their background colors to DEFAULT
                - make sure their states are set to YES, ie, playable
                - reset the selections array
                - update the misses label

            If the views' tags are equal, we have a match and we need to:

                - increment the match counter
                - set the views' backgrounds to MATCHED
                - make sure the views' states are set to NO
                - reset the selections array
                - update the matches label
                - reset game if game has been won

        If it's not time to compare . . .

            noOp

    If it's not playable

        noOp
     
    ------------------------------------------------------------------------------- */

    if ([self viewIsPlayable: view])
    {
        game.selectionCount++;
        [game.selections addObject:view];
        [self takeViewOutOfPlay: view];
        view.backgroundColor = SELECTED;
        if ([self itsTimeToCompareViews])
        {
            if ([self compareViews])
            {
                game.matchCounter++;
                [self setViewBackgroundsTo: MATCHED];
                [self setPlayabilityOfSelectedViews: NO];
                [self resetSelectionsArray];
                [self updateLabel: @"matches"];
                [self resetIfGameHasBeenWon];
            } else {
                game.missCounter++;
                [self setViewBackgroundsTo: DEFAULT];
                [self setPlayabilityOfSelectedViews: YES];
                [self resetSelectionsArray];
                [self updateLabel: @"misses"];
            }
        } else {
            // don't make comparison
        }
    } else {
        // view is not playable
    }
}

- (IBAction)resetGame:(id)sender
{
    [self resetGame];
}

@end


