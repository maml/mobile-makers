//
//  MAMLViewController.m
//  IntroToInterfaceBuilder
//
//  Created by Matthew Loseke on 9/18/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MAMLViewController.h"
#import "SecondViewController.h"

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

- (IBAction)showSecondView:(id)sender {
    
    SecondViewController *scv = [[SecondViewController alloc] init];
    [scv setName:_myTextField.text];
    [self presentViewController:scv animated:YES completion:nil];
}
@end
