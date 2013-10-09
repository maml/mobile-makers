//
//  MLViewController.m
//  Notification Center
//
//  Created by Matthew Loseke on 10/9/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLRootViewController.h"

@interface MLRootViewController () {

    id observer1, observer2, observer3;
    
}
@end

@implementation MLRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    observer1 = [nc addObserverForName:UIApplicationWillEnterForegroundNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        [self incrementCount];
    }];
    
    observer2 = [nc addObserverForName:@"My Notification" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        _ncLabel.text = @"Hai";
    }];
   
    observer3 = [nc addObserverForName:@"Downloaded Google" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        _ncLabel.text = [NSString stringWithFormat:@"%i bytes", [note.object length]];
    }];
}

- (void)incrementCount
{
    int count = _ncLabel.text.intValue;
    count++;
    _ncLabel.text = [NSString stringWithFormat:@"%i", count];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer1];
    [[NSNotificationCenter defaultCenter] removeObserver:observer2];
    [[NSNotificationCenter defaultCenter] removeObserver:observer3];
}

- (IBAction)buttonPushed:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"My Notification" object:nil];
}
@end
