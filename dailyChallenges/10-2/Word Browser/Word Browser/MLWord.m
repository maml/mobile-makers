//
//  MLWord.m
//  Word Browser
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLWord.h"

@implementation MLWord

@synthesize name, definition, synonyms;

- (MLWord *)initWithName: (NSString *)_name andDefinition:(NSString *)_definition
{
    self = [super init];
    
    name = _name;
    definition = _definition;
    synonyms = [[NSMutableArray alloc] init];
    
    return self;
}

@end
