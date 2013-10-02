//
//  MLPerson.m
//  DictionaryExample
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLPerson.h"

@implementation MLPerson

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

@end
