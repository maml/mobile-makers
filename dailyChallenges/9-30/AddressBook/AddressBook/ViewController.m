//
//  ViewController.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ShowPersonViewController.h"


@interface ViewController ()
@end

@implementation ViewController

@synthesize people, fileManager, documentDirectory;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[self tableView] reloadData];
}

-(UIViewController*)initWithCoder:(NSCoder*)aCoder
{
    self = [super initWithCoder:aCoder];
    
    if (self) {
       
        // used when both storing to and retrieving from the plist
        fileManager = [NSFileManager defaultManager];
        documentDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        
        if (![[NSUserDefaults standardUserDefaults] boolForKey:@"Has Data"]) {
            
            [self createPeopleAndStoreInPlist];
            
        } else {
            
            [self loadTableDataSourceFromPlist];
        
        }

    }

    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.people count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier =@"abc";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSDictionary *person = [self.people objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@" %@  %@", person[@"firstName"], person[@"lastName"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _indexOfSelectedPerson = indexPath.row;
    [self performSegueWithIdentifier:@"ShowPerson" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ShowPersonViewController *showPersonViewController = segue.destinationViewController;
    NSMutableDictionary *selectedPerson = people[_indexOfSelectedPerson];
    showPersonViewController.selectedPerson = selectedPerson;
}

- (void)createPeopleAndStoreInPlist
{
    // Create the peoples
    Person *p1 = [[Person alloc] initWithDictionary:@{@"firstName": @"Mary", @"lastName": @"Smith", @"emailAddress": @"jane.smith@company.com", @"phoneNumber": @"312-765-0987"}];
    
    Person *p2 = [[Person alloc] initWithDictionary:@{@"firstName": @"Julio", @"lastName": @"Juarez", @"emailAddress": @"J.juarez@company.com", @"phoneNumber": @"312-765-0988"}];
    
    Person *p3 = [[Person alloc] initWithDictionary:@{@"firstName": @"Sherri", @"lastName": @"Cortalinia", @"emailAddress": @"scortalinia@example.com", @"phoneNumber": @"312-765-0988"}];
    
    Person *p4 = [[Person alloc] initWithDictionary:@{@"firstName": @"Bill", @"lastName": @"Bigzby", @"emailAddress": @"biggyB@example.com", @"phoneNumber": @"312-765-0988"}];
    
    Person *p5 = [[Person alloc] initWithDictionary:@{@"firstName": @"Tanya", @"lastName": @"Pareaux", @"emailAddress": @"peereaux@example.com", @"phoneNumber": @"312-765-0988"}];
  
    // Store the peoples in array designate for the table's data source
    people =[[NSMutableArray alloc]init];
    [people addObject:[p1 dictionary]];
    [people addObject:[p2 dictionary]];
    [people addObject:[p3 dictionary]];
    [people addObject:[p4 dictionary]];
    [people addObject:[p5 dictionary]];

    // Store the peoples in user defaults
    [people writeToURL:[documentDirectory URLByAppendingPathComponent:@"people.plist"] atomically:YES];
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Has Data"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadTableDataSourceFromPlist
{
    people = [NSArray arrayWithContentsOfURL:[documentDirectory URLByAppendingPathComponent:@"people.plist"]];
}

@end
