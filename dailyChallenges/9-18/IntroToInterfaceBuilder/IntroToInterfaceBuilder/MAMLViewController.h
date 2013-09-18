//
//  MAMLViewController.h
//  IntroToInterfaceBuilder
//
//  Created by Matthew Loseke on 9/18/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAMLViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
- (IBAction)showSecondView:(id)sender;

@end
