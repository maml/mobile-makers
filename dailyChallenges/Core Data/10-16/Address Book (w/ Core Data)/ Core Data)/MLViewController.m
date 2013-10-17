//
//  MLViewController.m
//   Core Data)
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLAppDelegate.h"
#import "MLViewController.h"
#import "MLShowContactViewController.h"
#import "Contact.h"

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize fileManager, documentsDirectory, contacts, tableView, fetcher;

- (id)initWithCoder:(NSCoder *)aCoder
{
    if (self = [super initWithCoder:aCoder]) {
        fileManager = [NSFileManager defaultManager];
        documentsDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Unselect the selected row if any
    NSIndexPath *selection = [tableView indexPathForSelectedRow];
    if (selection) {
        [tableView deselectRowAtIndexPath:selection animated:YES];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self fetchFromCoreData];
}

- (void)fetchFromCoreData
{
    NSManagedObjectContext *moc = [(MLAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSFetchRequest *rq = [NSFetchRequest fetchRequestWithEntityName:@"Contact"];
    rq.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES]];
    
    fetcher = [[NSFetchedResultsController alloc] initWithFetchRequest:rq
                                                  managedObjectContext:moc
                                                    sectionNameKeyPath:nil
                                                             cacheName:nil];
    [fetcher performFetch:nil];
    fetcher.delegate = self;
}

/*
 If the sender initiating the segue is an instance of UITableViewCell we know that
 we know we're segueing into MLShowContactViewController, otherwise (the only other option)
 is to transition into MLAddContactViewController. In the case of the former we fetch the
 instance of the Contact that was selected from the table and assign it as the contact property
 of the MLShowContactViewController, and for the latter, we don't need to do anything,
 just transition to MLAddContactController
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        MLShowContactViewController *showContactViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [tableView indexPathForCell:sender];
        int row = indexPath.row;
        showContactViewController.contact = [fetcher.fetchedObjects objectAtIndex:row];
    }
}

#pragma mark NSFetchedResultsControllerDelegate

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    [tableView reloadData];
}

#pragma mark UITableViewDataSouce

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[fetcher fetchedObjects] count];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell *)[_tableView dequeueReusableCellWithIdentifier:@"Contact" forIndexPath:indexPath];
    
    Contact *contact = fetcher.fetchedObjects[indexPath.row];
    
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.number;
    return cell;
}

@end
