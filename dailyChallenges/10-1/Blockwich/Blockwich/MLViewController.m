//
//  MLViewController.m
//  Blockwich
//
//  Created by Matthew Loseke on 10/1/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

typedef NSInteger (^mathType)();

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)addXY:(UIButton *)sender
{
    NSInteger numberOne = _xtextField.text.integerValue;
    NSInteger numberTwo = _ytextField.text.integerValue;
    
    if (sender ==  _subtractButton) {
        [self updateLabelWithResultsOfBlock:^(){
            return numberOne - numberTwo;
        }];
    } else {
        [self updateLabelWithResultsOfBlock:^(){
            return numberOne + numberTwo;
        }];
    }
}

- (void)updateLabelWithResultsOfBlock: (mathType) block
{
    _resultLabel.text = [NSString stringWithFormat:@"%li", block()];
}

@end
