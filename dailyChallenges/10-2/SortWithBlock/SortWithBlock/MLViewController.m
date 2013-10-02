//
//  MLViewController.m
//  SortWithBlock
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	NSArray *things = @[@"a", @"b", @"c"];
    NSLog(@"things before sorted %@", things);
    
    NSArray *sortedThings = [things sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
        return [obj1 compare:obj2];
    }];
    NSLog(@"array after sorting %@", sortedThings);
}

@end
