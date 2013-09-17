//
//  ViewController.m
//  PleaseDon'tRejectMeApple
//
//  Created by Matthew Loseke on 9/17/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "ViewController.h"
#import "RiverNorth.h"
#import "FreshWater.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    RiverNorth *rn = [[RiverNorth alloc] init];
    [rn myMethod];
    
    FreshWater *fw = [[FreshWater alloc] init];
    [fw fromTheMountain];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
