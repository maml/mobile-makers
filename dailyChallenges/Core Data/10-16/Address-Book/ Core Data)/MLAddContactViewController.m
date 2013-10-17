//
//  MLAddContactViewController.m
//   Core Data)
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLAppDelegate.h"
#import "MLAddContactViewController.h"
#import "Contact.h"

@interface MLAddContactViewController ()

@end

@implementation MLAddContactViewController

@synthesize nameTextField, numberTextField;

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
}

- (IBAction)cancel:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)done:(id)sender
{
    [self saveNewContact];
}

/*  (void)saveNewContact
        - grab a reference to our AppDelegate's NSManagaedObjectContext
        - instantiate a new Contact entity from our data model
        - assign its attributes from the values of the inputs of this view's controller
        - call save on the managed object context
        - remove the keyboard
        - navigate back to the beginning
*/
- (void)saveNewContact
{
    NSManagedObjectContext *moc = [(MLAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    Contact *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:moc];
    newContact.name = nameTextField.text;
    newContact.number = numberTextField.text;
    [moc save:nil];
    [self resignFirstResponder];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
