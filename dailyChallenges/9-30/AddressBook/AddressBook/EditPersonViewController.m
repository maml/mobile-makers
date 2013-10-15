//
//  EditPersonViewController.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "EditPersonViewController.h"
#import "ShowPersonViewController.h"

@interface EditPersonViewController ()

@end

@implementation EditPersonViewController

@synthesize editablePerson;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _firstNameTextField.text = editablePerson[@"firstName"];
    _lastNameTextField.text = editablePerson[@"lastName"];
    _emailAddressTextField.text = editablePerson[@"emailAddress"];
    _phoneNumberTextField.text = editablePerson[@"phoneNumber"];
}

- (IBAction)updatePerson:(id)sender {

    ShowPersonViewController *spvc = [self.navigationController.viewControllers objectAtIndex:(self.navigationController.viewControllers.count -2)];
    spvc.selectedPerson[@"firstName"]       = _firstNameTextField.text;
    spvc.selectedPerson[@"lastName"]        = _lastNameTextField.text;
    spvc.selectedPerson[@"emailAddress"]    = _emailAddressTextField.text;
    spvc.selectedPerson[@"phoneNumber"]     = _phoneNumberTextField.text;

    [self.navigationController popViewControllerAnimated:YES];
}

@end
