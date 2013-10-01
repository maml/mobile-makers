//
//  ShowPersonViewController.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "ShowPersonViewController.h"
#import "EditPersonViewController.h"

@interface ShowPersonViewController ()

@end

@implementation ShowPersonViewController

@synthesize selectedPerson;

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
    [self setSelectedPersonAttributesToLabels];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self setSelectedPersonAttributesToLabels];
}

- (void)setSelectedPersonAttributesToLabels
{
    _firstNameLabel.text = selectedPerson.firstName;
    _lastNameLabel.text= selectedPerson.lastName;
    _emailAddressLabel.text = selectedPerson.emailAddress;
    _phoneNumberLabel.text = selectedPerson.phoneNumber;
}

- (IBAction)navigateToEditPerson:(id)sender
{
    [self performSegueWithIdentifier:@"EditPerson" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EditPersonViewController *editPersonViewController = segue.destinationViewController;
    [editPersonViewController setEditablePerson:selectedPerson ];
}

@end
