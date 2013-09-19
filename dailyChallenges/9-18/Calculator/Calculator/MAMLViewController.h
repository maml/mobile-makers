//
//  MAMLViewController.h
//  Calculator
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAMLViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *operandA;
@property (weak, nonatomic) IBOutlet UITextField *operandB;
@property (weak, nonatomic) IBOutlet UILabel *plusSign;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UIButton *buttonForEnter;

- (IBAction)compute:(id)sender;

@end
