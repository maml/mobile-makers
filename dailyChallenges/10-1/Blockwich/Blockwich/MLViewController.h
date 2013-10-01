//
//  MLViewController.h
//  Blockwich
//
//  Created by Matthew Loseke on 10/1/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *xtextField;
@property (weak, nonatomic) IBOutlet UITextField *ytextField;

- (IBAction)addXY:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *subtractButton;

@end
