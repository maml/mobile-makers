//
//  Person.h
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong,nonatomic) NSString* firstName;
@property (strong,nonatomic) NSString* lastName;
@property (strong,nonatomic) NSString* emailAddress;
@property (strong,nonatomic) NSString* phoneNumber;

- (NSDictionary *)dictionary;
- (id)initWithDictionary: (NSDictionary *)dictionary;

@end
