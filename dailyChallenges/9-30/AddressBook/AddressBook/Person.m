//
//  Person.m
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize firstName, lastName, emailAddress, phoneNumber;

- (id)initWithDictionary: (NSDictionary *)dictionary
{
    self = [super init];
    
    self.firstName = dictionary[@"firstName"];
    self.lastName = dictionary[@"lastName"];
    self.emailAddress = dictionary[@"emailAddress"];
    self.phoneNumber = dictionary[@"phoneNumber"];

    return self;
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    [dictionary setObject:firstName forKey:@"firstName"];
    [dictionary setObject:lastName forKey:@"lastName"];
    [dictionary setObject:emailAddress forKey:@"emailAddress"];
    [dictionary setObject:phoneNumber forKey:@"phoneNumber"];
    
    return dictionary;
}

@end

