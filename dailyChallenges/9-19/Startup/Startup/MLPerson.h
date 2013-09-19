//
//  MLPerson.h
//  Startup
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLPerson : NSObject

@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *email;
@property (nonatomic) int age;

+(MLPerson *) copy:(MLPerson *)person;
+(MLPerson *) initWithPerson:(MLPerson *)person;

@end
