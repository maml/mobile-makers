//
//  MLEditContactViewController.m
//   Core Data)
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLAppDelegate.h"
#import "MLEditContactViewController.h"
#import "MLShowContactViewController.h"

@interface MLEditContactViewController ()

@end

@implementation MLEditContactViewController

@synthesize contact, nameTextField, numberTextField;

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
    nameTextField.text = contact.name;
    numberTextField.text = contact.number;
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)done:(id)sender
{
    [self editContact];
}

/*  (void)editContact
 - grab a reference to our AppDelegate's NSManagaedObjectContext
 - update the controller's contact property with values from the text fields
 - call save on the managed object context
 - remove the keyboard
 - navigate back to the previous controller
 */
- (void)editContact
{
    NSManagedObjectContext *moc = [(MLAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    contact.name = nameTextField.text;
    contact.number = numberTextField.text;
    [moc save:nil];
    [self resignFirstResponder];
    
    MLShowContactViewController *showContactViewController = [[self.navigationController viewControllers] objectAtIndex:[self.navigationController viewControllers].count - 2];
    showContactViewController.contact = contact;
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
