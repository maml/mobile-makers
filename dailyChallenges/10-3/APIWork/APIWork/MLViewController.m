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
    NSURL *url = [NSURL URLWithString:@"http://www.mobilemakers.co/lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
        NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
        NSMutableString *superHeroString = [[NSMutableString alloc] init];
        
                               for (NSDictionary *superHeroDictionary in responseArray) {
                                   NSString *name = [superHeroDictionary objectForKey:@"name"];
                                   NSString *description = [superHeroDictionary objectForKey:@"description"];
                                   
                                   [superHeroString appendFormat:@"%@\n%@\n\n", name, description];
                               }
    
        textView.text = superHeroString;
    }];


    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
