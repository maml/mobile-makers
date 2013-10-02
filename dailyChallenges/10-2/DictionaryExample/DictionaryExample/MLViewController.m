//
//  MLViewController.m
//  DictionaryExample
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

    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    MLPerson *p1 = [[MLPerson alloc] init];
    MLPerson *p2 = [[MLPerson alloc] init];
    
    [p1 setFirstName:@"Bill"];
    [p1 setLastName:@"Murray"];
    
    [p2 setFirstName:@"Johnny"];
    [p2 setLastName:@"Carson"];
    
    [dict setObject:@[p1, p2] forKey:@"S"];
    
    [dict setObject:p1 forKey:@"M"];
    [dict setObject:p2 forKey:@"C"];
    
    // shorthand to set
    // dict[@"S"];
    
    // best way to iterate over everything in a dictionary, should one need to
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@: %@", key, obj);
    }];

    // the following is possible but not recommended (by Max)
    // for (id key in dict){
    //     dict[key];
    //     [dict objectForKey:key];
    // }

}

@end
