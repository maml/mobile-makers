//
//  MLViewController.m
//  Properties
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLPerson.h"

@interface MLViewController ()
{
    __weak IBOutlet UITextField *textInput;
    __weak IBOutlet UILabel *textInputLabel;
    MLPerson *p;
}
- (IBAction)pressedButton:(id)sender;
@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    p = [[MLPerson alloc] init];
    [p setName:@"Maml"];
    textInputLabel.text = [p name];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedButton:(id)sender {
    [p setName:textInput.text];
    textInputLabel.text = [p name];
}
@end
