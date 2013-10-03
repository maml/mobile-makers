//
//  MLWord.h
//  Word Browser
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLWord : NSObject

- (MLWord *)initWithName: (NSString *)_name andDefinition:(NSString *)_definition;

@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) NSString *definition;
@property (strong, nonatomic) NSMutableArray *synonyms;

@end
