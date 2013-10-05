//
//  MMSnippetViewController.m
//  Wikipedia
//
//  Created by Matthew Loseke on 10/3/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import "MMSnippetViewController.h"
#import "MMWebViewController.h"

@interface MMSnippetViewController ()

@end

@implementation MMSnippetViewController

@synthesize title, snippet, snippetTextView;

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MMWebViewController *vc = segue.destinationViewController;

    // construct the URI of the Wikipedia page we need to load
    NSString *baseURIofWikiPage = @"https://en.wikipedia.org/wiki/";
    NSString *URIofWikiPage = [baseURIofWikiPage stringByAppendingString:[NSString stringWithFormat:@"%@", title]];
    NSURL *url = [[NSURL alloc] initWithString:URIofWikiPage];
    
    vc.url = url;
}

@end
