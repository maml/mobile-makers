//
//  MLViewController.h
//  Simon Says
//
//  Created by Matthew Loseke on 10/10/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLColorPanelView.h"
#import "MLGame.h"

@interface MLViewController : UIViewController <ColorPanelDelegate, GameEventsDelegate>

@property (strong, nonatomic) MLGame *game;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSMutableDictionary *colorPanelViews;

@property int i;

@property (strong, nonatomic) IBOutlet UILabel *highScore;
@property (strong, nonatomic) IBOutlet UILabel *currentScore;
@property (strong, nonatomic) IBOutlet UILabel *lives;
@property (strong, nonatomic) IBOutlet UILabel *level;

@end
