//
//  MLViewController.m
//  Color Notifications
//
//  Created by Matthew Loseke on 10/9/13.
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

- (IBAction)go:(id)sender {
    
    // we pass the UI's instance of UITextField as the object
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Time to change the color" object:_colorTextField];
    
    // remove the keyboard from UI
    [_colorTextField resignFirstResponder];
    
}

@end
