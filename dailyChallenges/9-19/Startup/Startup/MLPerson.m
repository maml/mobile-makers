//
//  MLPerson.m
//  Startup
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLPerson.h"

@implementation MLPerson

@synthesize name, email, age;

+(MLPerson *) initWithPerson:(MLPerson *)person
{
    return [self copy:person];
}

+(MLPerson *) copy:(MLPerson *)person
{
    MLPerson *copy = [[MLPerson alloc] init];
    [copy setName:[person name]];
    [copy setEmail:[person email]];
    return copy;
}

-(int) age
{
    return (age > 50) ? 21 : age;
}

@end
