//
//  MLViewController.m
//  Word Browser
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLWord.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // construct 20 new words, for each new word, construct 2 synonyms
    [self createSomeWords];
    
    
}

- (MLWord *)constructWordWithName: (NSString *)name andDefinition:(NSString *)definition
{
    MLWord *word = [[MLWord alloc] init];
    word.name = name;
    word.definition = definition;
    
    return word;
}

- (void)createSomeWords
{
    MLWord *octothorp = [[MLWord alloc] initWithName:@"octothorp" andDefinition:@"another term for the pound sign (#)."];
    MLWord *poundsign = [[MLWord alloc] initWithName:@"pound sign" andDefinition:@"the sign (#), representing a pound as a unit of weight or mass, or as represented on a telephone keypad or computer keyboard."];
    MLWord *hashtag = [[MLWord alloc] initWithName:@"hash tag" andDefinition:@"a symbol used for tagging on Twitter."];
    
    MLWord *variable = [[MLWord alloc] initWithName:@"variable" andDefinition:@"a data item that may take on more than one value during the runtime of a program."];
    MLWord *mutable = [[MLWord alloc] initWithName:@"mutable" andDefinition:@"liable to change."];
    MLWord *capricious = [[MLWord alloc] initWithName:@"capricious" andDefinition:@"given to sudden and unaccountable changes of mood or behavior."];
    
    MLWord *loop = [[MLWord alloc] initWithName:@"loop" andDefinition:@"a programmed sequence of instructions that is repeated until or while a particular condition is satisfied."];
    MLWord *noose = [[MLWord alloc] initWithName:@"noose" andDefinition:@"a loop with a running knot, tightening as the rope or wire is pulled and typically used to hang people or trap animals."];
    MLWord *helix = [[MLWord alloc] initWithName:@"helix" andDefinition:@"an object having a three-dimensional shape like that of a wire wound uniformly in a single layer around a cylinder or cone, as in a corkscrew or spiral staircase."];
    
    
    MLWord *block = [[MLWord alloc] initWithName:@"block" andDefinition:@"a large piece of text processed as a unit."];
    MLWord *cube = [[MLWord alloc] initWithName:@"cube" andDefinition:@"a symmetrical three-dimensional shape, either solid or hollow, contained by six equal squares."];
    MLWord *bar = [[MLWord alloc] initWithName:@"bar" andDefinition:@"a long rod or rigid piece of wood, metal, or similar material, typically used as an obstruction, fastening, or weapon."];

    // synonyms for octothorp
    [octothorp.synonyms addObject:poundsign];
    [octothorp.synonyms addObject:hashtag];
    
    // synonyms for pound sign
    [poundsign.synonyms addObject:hashtag];
    [poundsign.synonyms addObject:octothorp];
    
    // synonyms for hashtag
    [hashtag.synonyms addObject:poundsign];
    [hashtag.synonyms addObject:octothorp];
    
    // synonyms for variable
    [variable.synonyms addObject:mutable];
    [variable.synonyms addObject:capricious];
    
    // synonyms for mutable
    [mutable.synonyms addObject:variable];
    [mutable.synonyms addObject:capricious];
    
    // synonyms for capricious
    [capricious.synonyms addObject:variable];
    [capricious.synonyms addObject:mutable];
    
    // synonyms for loop
    [loop.synonyms addObject:helix];
    [loop.synonyms addObject:noose];
    
    // synonyms for helix
    [helix.synonyms addObject:loop];
    [helix.synonyms addObject:noose];
    
    // synonyms for noose
    [noose.synonyms addObject:loop];
    [noose.synonyms addObject:helix];
    
    // synonyms for block
    [block.synonyms addObject:cube];
    [block.synonyms addObject:bar];
    
    // synonyms for cube
    [cube.synonyms addObject:block];
    [cube.synonyms addObject:bar];
    
    // synonyms for bar
    [bar.synonyms addObject:block];
    [bar.synonyms addObject:cube];

}

@end



















