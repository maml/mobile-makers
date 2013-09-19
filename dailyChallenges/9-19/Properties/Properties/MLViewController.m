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
    __weak IBOutlet UITextField *textInput2;
    __weak IBOutlet UILabel *textInputLabel2;

    MLPerson *p;
    MLPerson *p2;
}
- (IBAction)pressedButton:(UIButton *)sender;
@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    p = [[MLPerson alloc] init];
    [p setName:@"Maml"];
    [p setSalary:10000];
    textInputLabel.text = [p name];
    
    p2 = [[MLPerson alloc] init];
    [p2 setName:@"Purrsuits"];
    [p2 setSalary:15000];
    textInputLabel2.text = [p2 name];
    
    NSLog(@"Person salary is %.f", [p salary]);
    NSLog(@"Person net salary is %.f", [p netSalary]);
    NSLog(@"Person2 salary is %.f", [p2 salary]);
    NSLog(@"Person2 net salary is %.f", [p2 netSalary]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressedButton:(UIButton *)sender {
    
    if ([sender tag] ==1 ) {
        [p setName:textInput.text];
        textInputLabel.text = [p name];
    } else {
        [p2 setName:textInput2.text];
        textInputLabel2.text = [p2 name];
    }
}
@end
