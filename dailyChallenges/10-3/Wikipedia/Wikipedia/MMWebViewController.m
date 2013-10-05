//
//  MMWebViewController.m
//  Wikipedia
//
//  Created by Matthew Loseke on 10/4/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import "MMWebViewController.h"

@interface MMWebViewController ()

@end

@implementation MMWebViewController

@synthesize url, webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // ^_^
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@", url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    // calling sharedApplication on UIApplication returns the singleton instance of the application. Calling
    // openURL with request object will render and smother whatever's going on in your view controller, ie.
    // navigation controller's, tab views, etc.
    
    //[[UIApplication sharedApplication] openURL:request.URL];
}

@end







