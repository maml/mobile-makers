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

    // array of attributes we'll use to create instances of Person
    NSArray *params =
        @[
          @[@"Julio", @"Juarez"],
          @[@"Don", @"Juan"],
          @[@"Manuel", @"Noriega"],
          @[@"Juan", @"Valdez"],
          @[@"Juanita", @"Valdez"]
        ];

    // iterate through params and create instances of Person, and then add to the people array
    [params enumerateObjectsUsingBlock:^(NSArray *array, NSUInteger idx, BOOL *stop) {
        MLPerson *p = [[MLPerson alloc] initWithFirstName:array[0] andLastName:array[1]];
        [people addObject:p];
    }];

    // sort people by last name, if last name is equal, then sort by first name
    [people sortUsingComparator:^NSComparisonResult(MLPerson *obj1, MLPerson *obj2) {
        
        int lastNameOrder = [obj1.lastName compare:obj2.lastName];
        
        if (lastNameOrder == NSOrderedSame) {
            return [obj1.firstName compare:obj2.firstName];
        } else {
            return lastNameOrder;
        }
    }];
    
    // enumeration example
    [people enumerateObjectsUsingBlock:^(MLPerson *obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"Person %d %@ %@", idx, obj.firstName, obj.lastName);
    }];
    
}

@end
