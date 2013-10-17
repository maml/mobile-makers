//
//  MLShowContactViewController.m
//   Core Data)
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLShowContactViewController.h"
#import "MLEditContactViewController.h"

@interface MLShowContactViewController ()

@end

@implementation MLShowContactViewController

@synthesize contact, contactName, contactNumber;

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
    contactName.text = contact.name;
    contactNumber.text = contact.number;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    contactName.text = contact.name;
    contactNumber.text = contact.number;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MLEditContactViewController *editViewController = segue.destinationViewController;
    editViewController.contact = contact;
}

@end
