//
//  MySingleton.h
//  GCD
//
//  Created by Matthew Loseke on 10/17/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySingleton : NSObject

+ (MySingleton *)sharedInstance;

- (void)describe;

@end
