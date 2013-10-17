//
//  MySingleton.m
//  GCD
//
//  Created by Matthew Loseke on 10/17/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton

static MySingleton *sMySingleton;

+ (MySingleton *)sharedInstance
{
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sMySingleton = [[MySingleton alloc] init];
    });
    
    return sMySingleton;
}

- (id)init
{
    if (self = [super init]) {
        NSLog(@"instantiating the singleton here: %@", self);
    }
    
    return self;
}

- (void)describe
{
    NSLog(@"this is me");
}

@end
