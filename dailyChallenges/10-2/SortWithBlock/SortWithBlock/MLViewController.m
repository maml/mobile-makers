//
//  MLViewController.m
//  SortWithBlock
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLPerson.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *people = [[NSMutableArray alloc] init];
    
    MLPerson *p1 = [[MLPerson alloc] init];
    [p1 setFirstName:@"Julio"];
    [p1 setLastName:@"Juarez"];
    
    MLPerson *p2 = [[MLPerson alloc] init];
    [p2 setFirstName:@"Don"];
    [p2 setLastName:@"Juan"];

    MLPerson *p3 = [[MLPerson alloc] init];
    [p3 setFirstName:@"Manuel"];
    [p3 setLastName:@"Noriega"];
    
    MLPerson *p4 = [[MLPerson alloc] init];
    [p4 setFirstName:@"Juan"];
    [p4 setLastName:@"Valdez"];
    
    [people addObject:p1];
    [people addObject:p2];
    [people addObject:p3];
    [people addObject:p4];
    
    MLPerson *p5 = [[MLPerson alloc] init];
    [p5 setFirstName:@"Juanita"];
    [p5 setLastName:@"Valdez"];
    
    [people addObject:p5];
    
    [people sortUsingComparator:^NSComparisonResult(MLPerson *obj1, MLPerson *obj2) {
        
        int lastNameOrder = [obj1.lastName compare:obj2.lastName];
        
        if (lastNameOrder == NSOrderedSame) {
            return [obj1.firstName compare:obj2.firstName];
        } else {
            return lastNameOrder;
        }
    }];
    
    for (MLPerson *person in people) {
        NSLog(@"%@, %@", person.lastName, person.firstName);
    }
    
}

@end
