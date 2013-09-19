//
//  MAMLViewController.m
//  Calculator
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MAMLViewController.h"
#import "MAMLCalc.h"

@interface MAMLViewController ()

@end

@implementation MAMLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)compute:(id)sender {
    
    NSString *a = [NSString stringWithFormat:@"%@", _operandA.text];
    NSString *b = [NSString stringWithFormat:@"%@", _operandB.text];
    
    MAMLCalc *mc = [[MAMLCalc alloc] init];
    
    int c = [mc add:([a intValue]) to:([b intValue])];
    
    _result.text = [NSString stringWithFormat: @"%i", c];
}
@end
