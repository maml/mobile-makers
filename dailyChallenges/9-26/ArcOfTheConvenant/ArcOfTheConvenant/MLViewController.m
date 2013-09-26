//
//  MLViewController.m
//  ArcOfTheConvenant
//
//  Created by Matthew Loseke on 9/26/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLaocObject.h"

@interface MLViewController ()
{
    NSMutableArray *myArray;
    MLaocObject *myObject;
}
@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myObject = [[MLaocObject alloc] init];
    
    myArray = [NSMutableArray arrayWithCapacity:10];
    
    NSLog(@"retain count is %i\n (%@)", [myObject retainCount], myObject);
    
    [myArray addObject:myObject];
    
    NSLog(@"retain count is %i\n (%@)", [myObject retainCount], myObject);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)revealRetainCount:(id)sender {
    NSLog(@"retain count is %i", [myObject retainCount]);
}
@end
