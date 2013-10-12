//
//  MLViewController.h
//  Simon Says
//
//  Created by Matthew Loseke on 10/10/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLColorPanelView.h"

@interface MLViewController : UIViewController <ColorPanelDelegate>

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSMutableDictionary *colorPanelViews;
@property (strong, nonatomic) NSArray *cpuSequence;

@property int playerTouchCount;
@property int i;

@end
