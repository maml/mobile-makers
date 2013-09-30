//
//  MLViewController.h
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/26/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLmyView.h"
#import "MLGame.h"
#import "MLTimer.h"

@interface MLViewController : UIViewController <MLMatchDelegate, MLTickDelegate>

@property (weak, nonatomic) IBOutlet UILabel *matchesLabel;
@property (weak, nonatomic) IBOutlet UILabel *missesLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;

@property (strong, nonatomic) MLGame *game;
@property (strong, nonatomic) MLTimer *mlt;
@property (strong, nonatomic) NSTimer *mltTimer;

@property (strong, nonatomic) NSMutableArray *myViews;
@property (strong, nonatomic) NSMutableArray *images;

- (IBAction)resetGame:(id)sender;

@end
