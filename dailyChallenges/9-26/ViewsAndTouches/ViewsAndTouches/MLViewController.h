//
//  MLViewController.h
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/26/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLmyView.h"

@interface MLViewController : UIViewController <MLMatchDelegate>

@property int previousSelection;
@property int selectionCount;
@property int matchCounter;
@property int missCounter;

@property (strong, nonatomic) NSMutableArray *selections;
@property (weak, nonatomic) IBOutlet UILabel *matchesLabel;
@property (weak, nonatomic) IBOutlet UILabel *missesLabel;
- (IBAction)resetGame:(id)sender;

@end
