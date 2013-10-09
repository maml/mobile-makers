//
//  MLAppDelegate.m
//  Notification Center
//
//  Created by Matthew Loseke on 10/9/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLAppDelegate.h"

@implementation MLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    id url = @"http://www.google.com";
    url = [NSURL URLWithString:url];
    id request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Downloaded Google" object:data];
    }];
    
    return YES;
}
@end