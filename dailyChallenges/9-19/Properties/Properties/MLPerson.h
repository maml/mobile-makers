//
//  MLPerson.h
//  Properties
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLPerson : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float salary;
@property (readonly) float netSalary;

@end
