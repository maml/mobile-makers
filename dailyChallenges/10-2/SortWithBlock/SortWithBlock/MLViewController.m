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
    
    MLPerson *p1 = [[MLPerson alloc] initWithFirstName:@"Julio" andLastName:@"Juarez"];
    MLPerson *p2 = [[MLPerson alloc] initWithFirstName:@"Don" andLastName:@"Juan"];
    MLPerson *p3 = [[MLPerson alloc] initWithFirstName:@"Manuel" andLastName:@"Noriega"];
    MLPerson *p4 = [[MLPerson alloc] initWithFirstName:@"Juan" andLastName:@"Valdez"];
    MLPerson *p5 = [[MLPerson alloc] initWithFirstName:@"Juanita" andLastName:@"Valdez"];
    
    [@[p1, p2, p3, p4, p5] enumerateObjectsUsingBlock:^(MLPerson *obj, NSUInteger idx, BOOL *stop) {
        [people addObject:obj];
    }];
    
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
