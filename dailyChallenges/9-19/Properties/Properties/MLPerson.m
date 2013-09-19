//
//  MLPerson.m
//  Properties
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLPerson.h"

@implementation MLPerson

@synthesize name, salary, netSalary;

-(float) netSalary
{
    return salary - (salary * 0.15);
}

@end
