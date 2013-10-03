//
//  MLViewController.m
//  APIWork
//
//  Created by Matthew Loseke on 10/3/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize textView;

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://www.google.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
        NSString *responseString = [[NSString alloc] initWithBytes:[data bytes]
                                                            length:[data length]
                                                          encoding:NSUTF8StringEncoding];
    
        textView.text = responseString;
        NSLog(@"inside the block");
    }];
    
    NSLog(@"just made the web call");

    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
