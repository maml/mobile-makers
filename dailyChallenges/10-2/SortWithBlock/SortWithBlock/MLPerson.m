//
//  MLPerson.m
//  SortWithBlock
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLPerson.h"

@implementation MLPerson

- (MLPerson *)initWithFirstName: (NSString *)firstName andLastName:(NSString *)lastName
{
    self = [super init];

    [self setFirstName:firstName];
    [self setLastName:lastName];

    return self;
}

@end
