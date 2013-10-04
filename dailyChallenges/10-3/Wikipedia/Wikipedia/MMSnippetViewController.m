//
//  MMSnippetViewController.m
//  Wikipedia
//
//  Created by Matthew Loseke on 10/3/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import "MMSnippetViewController.h"

@interface MMSnippetViewController ()

@end

@implementation MMSnippetViewController

@synthesize snippet, snippetTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    snippetTextView.text = snippet;
}

@end
