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
	// Do any additional setup after loading the view, typically from a nib.
}

- (MLWord *)constructWordWithName: (NSString *)name andDefinition:(NSString *)definition
{
    MLWord *word = [[MLWord alloc] init];
    word.name = name;
    word.definition = definition;
    
    return word;
}

@end
