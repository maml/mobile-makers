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
    
    if (self) {
        self.firstName = dictionary[@"firstName"];
        self.lastName = dictionary[@"lastName"];
        self.emailAddress = dictionary[@"emailAddress"];
        self.phoneNumber = dictionary[@"phoneNumber"];
    }
   
    return self;
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:[NSString stringWithFormat:@"%@", self.firstName] forKey:@"firstName"];
    [dictionary setObject:[NSString stringWithFormat:@"%@", self.lastName] forKey:@"lastName"];
    [dictionary setObject:[NSString stringWithFormat:@"%@", self.emailAddress] forKey:@"emailAddress"];
    [dictionary setObject:[NSString stringWithFormat:@"%@", self.phoneNumber] forKey:@"phoneNumber"];
    return dictionary;
}

@end

