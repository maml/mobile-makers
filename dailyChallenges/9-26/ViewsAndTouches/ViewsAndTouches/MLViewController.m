//
//  MLViewController.m
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/26/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#define DEFAULT  [UIColor lightGrayColor]
#define SELECTED [UIColor orangeColor]
#define MATCHED  [UIColor greenColor]

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize game, selections, matchCounter, missCounter;

- (void)viewDidLoad
{
    // create an instance of MLGame
    game = [[MLGame alloc] init];
    
    self.selections = [[NSMutableArray alloc] initWithCapacity:2];
    
    game.selectionCount = 0;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[MLmyView class]]) {
            MLmyView *myView = (MLmyView *) view;
            myView.delegate = self;
            myView.state = YES;
        }
    }
}

// view is playable if its state is `on` ie, YES
- (BOOL)viewIsPlayable: (MLmyView *)view
{
    if (view.state == YES) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)itsTimeToCompareViews
{
    if (game.selectionCount %2 == 0) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)compareViews
{
    MLmyView *view1 = self.selections[0];
    MLmyView *view2 = self.selections[1];
    return view1.tag == view2.tag;
}

- (void)setViewBackgroundsTo: (UIColor *)color
{
    for (MLmyView *view in selections)
    {
        view.backgroundColor = color;
    }
}

- (void)setPlayabilityOfSelectedViews: (BOOL)state
{
    for (MLmyView *view in selections)
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
    [self.selections removeAllObjects];
}

- (void)resetIfGameHasBeenWon
{
    if (matchCounter == 8) {
        [self resetGame];
    }
}

- (void)resetGame
{
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[MLmyView class]]) {
            MLmyView *myView = (MLmyView *) view;
            myView.backgroundColor = DEFAULT;
            myView.state = YES;
        }
    }
    self.matchCounter = 0;
    self.missCounter = 0;
    _matchesLabel.text = @"Matches:";
    _missesLabel.text = @"Misses:";
}

- (void)updateLabel: (NSString *)label
{
    if ([label isEqual: @"matches"]) {
        _matchesLabel.text = [NSString stringWithFormat:@"Matches: %i", self.matchCounter];
    } else {
        _missesLabel.text = [NSString stringWithFormat:@"Misses: %i", self.missCounter];
    }
}

- (void)didChooseView:(MLmyView *)view
{
    
    // When a view's been 'touched' we need to first check and see if it's 'playable'
    // ie, it's state is YES.
    //
    // If it's playable we need to
    // - increment selectionCount.
    // - set its background to SELECTED
    // - add view to selections array
    // - take it out of play
    //
    // Note onf selectionCount - The selectionCount is
    // what allows us to determine if we need to make a comparison or not. We make a
    // comparison check every even, or, every other trun.
    //
    // If it's time to compare . . .
    //
    // If the views' tags are not equal we need to:
    // - update the misses counter
    //  - restore their background colors to DEFAULT
    // - make sure their states are set to YES, ie, 'playable'
    // - reset the selections array
    // - reset game if game has been won
    // - update the misses label
    //
    // If the views' tags are equal, we have a match and we need to:
    // - increment the match counter
    // - set the views' backgrounds to MATCHED
    // - make sure the views' states are set to NO
    // - reset the selections array
    // - update the matches label
    //
    // If it's not time to compare . . .
    //
    // noOp
    //
    // If it's not playable
    //
    // noOp

    if ([self viewIsPlayable: view]) {
        game.selectionCount++;
        [self.selections addObject:view];
        [self takeViewOutOfPlay: view];
        view.backgroundColor = SELECTED;
        if ([self itsTimeToCompareViews]) {
            if ([self compareViews]) {
                self.matchCounter++;
                [self setViewBackgroundsTo: MATCHED];
                [self setPlayabilityOfSelectedViews: NO];
                [self resetSelectionsArray];
                [self updateLabel: @"matches"];
                [self resetIfGameHasBeenWon];
            } else {
                self.missCounter++;
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


