//
//  SecondViewController.h
//  IntroToInterfaceBuilder
//
//  Created by Matthew Loseke on 9/18/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *myButton;
- (IBAction)backtoFirstView:(id)sender;
@property NSString *name;
@property (weak, nonatomic) IBOutlet UILabel *myViewTwoLabel;

@end
