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
@synthesize people;

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

        people =[[NSMutableArray alloc]init];
        
        Person *p1 = [[Person alloc]init];
        p1.firstName =@"Jane";
        p1.lastName =@"Smith";
        p1.emailAddress = @"jane.smith@company.com";
        p1.phoneNumber=@"312-765-0987";
        
        
        Person *p2 = [[Person alloc]init];
        p2.firstName =@"Julio";
        p2.lastName =@"Juarez";
        p2.emailAddress = @"J.juarez@company.com";
        p2.phoneNumber=@"312-765-0988";
        
        
        Person *p3 = [[Person alloc]init];
        p3.firstName =@"Bill";
        p3.lastName =@"Frederickson";
        p3.emailAddress = @"b.frederickson@company.com";
        p3.phoneNumber=@"312-765-0989";
        
        Person *p4 = [[Person alloc]init];
        p4.firstName =@"Charles";
        p4.lastName =@"Xavier";
        p4.emailAddress = @"Charles.Xavier@company.com";
        p4.phoneNumber=@"312-765-0990";
        
        Person *p5 = [[Person alloc]init];
        p5.firstName =@"Timmy";
        p5.lastName =@"Jones";
        p5.emailAddress = @"t.jones@company.com";
        p5.phoneNumber=@"312-765-0991";
        
        [people addObject:p1];
        [people addObject:p2];
        [people addObject:p3];
        [people addObject:p4];
        [people addObject:p5];
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
    
    Person *personTemp =self.people[indexPath.row];
    
    cell.textLabel.text =  [NSString stringWithFormat:@" %@  %@", personTemp.firstName,personTemp.lastName ];
    
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
    Person *selectedPerson = people[_indexOfSelectedPerson];
    showPersonViewController.selectedPerson = selectedPerson;
}

@end
