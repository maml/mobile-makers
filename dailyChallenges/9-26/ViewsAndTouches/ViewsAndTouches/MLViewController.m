//
//  MLViewController.m
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/26/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#define DEFAULT  [UIColor lightGrayColor]

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize game, mlt, myViews, images;

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

            myView.layer.backgroundColor = DEFAULT.CGColor;
            myView.layer.name = @"colorLayer";
        }
    }
    
    [self associateImagesWithViews];
}

- (void)associateImagesWithViews
{
    // create a mutable array to hold each instance of MLmyView
    // create a mutable array to hold each image
    // then,
    // randomly grab two view instances and randomly grab one image
    // give them the same tag number
    // and the image as a layer name imageLayer to each of the two views
    // then,
    // remove the two views from the mutable array holding the views and
    
    myViews = [[NSMutableArray alloc] init];
    images = game.imageNames;
    
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[MLmyView class]])
        {
            MLmyView *myView = (MLmyView *) view;
            [myViews addObject:myView];
        }
    }
    
    int i = 0;
    
    while (myViews.count != 0) {
        int index = arc4random() % (myViews.count);
        MLmyView *view1 = myViews[index];
        [myViews removeObject:view1];
        
        index = arc4random() % (myViews.count);
        MLmyView *view2 = myViews[index];
        [myViews removeObject:view2];
        
        [view1 setTag:i];
        [view2 setTag:i];
        [self setIMageToLayerOfView: view1 index:i];
        [self setIMageToLayerOfView: view2 index:i];
        i++;
    }
}

- (void)setIMageToLayerOfView: (MLmyView *)view index:(int)index;
{
    // the sublayer with the image is name (imageLayer) but right now
    // we know we only have one sublayer, which is the sublayer with the imave
    if ([view.layer sublayers]) {
        NSLog(@"all subsequent resets");
        CALayer *layer = view.layer.sublayers[0];
        layer.contents = (id) [[UIImage alloc] initWithContentsOfFile:images[index]].CGImage;
    } else {
        NSLog(@"first time through");
        CALayer *imageLayer = [CALayer layer];
        imageLayer.contents = (id) [[UIImage alloc] initWithContentsOfFile:images[index]].CGImage;
        imageLayer.frame = CGRectMake(0, 0, 64, 64);
        imageLayer.opacity = 0;
        imageLayer.name = @"imageLayer";
        [view.layer addSublayer:imageLayer];
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

- (void)setViewLayerBackgroundsTo: (NSString *)str
{
    if ([str isEqualToString:@"matched"]) {
        for (MLmyView *view in game.selections)
        {
            //view.layer.backgroundColor = color.CGColor;
            CALayer *imageLayer = view.layer.sublayers[0];
            imageLayer.opacity = 1;
        }
    } else if ([str isEqualToString:@"default"]) {
        for (MLmyView *view in game.selections) {
            CALayer *imageLayer = view.layer.sublayers[0];
            imageLayer.opacity = 0;
        }
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
    [self associateImagesWithViews];
}

- (void)resetUI
{
    // set each view's color back to default and their state to playable
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[MLmyView class]])
        {
            MLmyView *myView = (MLmyView *) view;

            myView.layer.backgroundColor = DEFAULT.CGColor;
            CALayer *imageLayer = view.layer.sublayers[0];
            imageLayer.opacity = 0;

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
        //view.backgroundColor = TOUCHED;
        CALayer *imageLayer = view.layer.sublayers[0];
        imageLayer.opacity = 1;
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

        //view.layer.backgroundColor = SELECTED.CGColor;
        CALayer *imageLayer = view.layer.sublayers[0];
        imageLayer.opacity = 1;
        
        if ([self itsTimeToCompareViews])
        {
            if ([self compareViews])
            {
                game.matchCounter++;

                [self setViewLayerBackgroundsTo: @"matched"];
                
                [self setPlayabilityOfSelectedViews: NO];
                [self resetSelectionsArray];
                [self updateLabel: @"matches"];
                [self resetIfGameHasBeenWon];
            } else {
                game.missCounter++;

                [self setViewLayerBackgroundsTo: @"default"];

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


