//
//  MLViewController.m
//  GCD
//
//  Created by Matthew Loseke on 10/17/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MySingleton.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    NSArray *array1 = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    NSArray *array2 = @[@1, @2, @3, @4, @5, @6, @7, @8, @9, @10];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
   
    [super viewDidLoad];
    
    dispatch_async(queue, ^{
        [array1 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"element in array1 is: %@", obj);
            MySingleton *s = [MySingleton sharedInstance];
            NSLog(@"s is %@", s);
        }];
    });

    dispatch_async(queue, ^{
    [array2 enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"element in array2 is: %@", obj);
        MySingleton *s = [MySingleton sharedInstance];
        NSLog(@"s is %@", s);
    }];
   });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
