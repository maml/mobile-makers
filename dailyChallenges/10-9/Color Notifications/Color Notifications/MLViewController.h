//
//  MLViewController.h
//  Color Notifications
//
//  Created by Matthew Loseke on 10/9/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *colorTextField;
- (IBAction)go:(id)sender;

@end
