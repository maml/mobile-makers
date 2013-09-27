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

@interface MLViewController : UIViewController <MLMatchDelegate>

@property (strong, nonatomic) MLGame *game;

@property (weak, nonatomic) IBOutlet UILabel *matchesLabel;
@property (weak, nonatomic) IBOutlet UILabel *missesLabel;
- (IBAction)resetGame:(id)sender;

@end
