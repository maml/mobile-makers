//
//  MMViewController.m
//  Wikipedia
//
//  Created by Hammad  on 10/3/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import "MMViewController.h"
#import "MMSearchViewController.h"

@interface MMViewController ()

@end

@implementation MMViewController

@synthesize searchTermTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButton:(id)sender {
    
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    MMSearchViewController *vc = segue.destinationViewController;
    vc.searchTerm = searchTermTextField.text;
    
}



@end
