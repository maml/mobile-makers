//
//  MLViewController.m
//  MyFavoriteThingsPrep
//
//  Created by Matthew Loseke on 9/24/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

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

- (IBAction)addToTextView:(id)sender {
    [self.textField resignFirstResponder];
    self.textView.text = [self.textView.text stringByAppendingString:@"\n"];
    self.textView.text = [self.textView.text stringByAppendingString:self.textField.text];
    self.textField.text = @"";
}

@end


