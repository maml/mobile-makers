//
//  MLViewController.m
//  Categories
//
//  Created by Matthew Loseke on 10/9/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "NSString+Reverse.h"

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

- (IBAction)doIt:(id)sender {
    NSString *text = _textField.text;
    _textLabel.text = text.reversedString;
    [_textField resignFirstResponder];
}

@end
