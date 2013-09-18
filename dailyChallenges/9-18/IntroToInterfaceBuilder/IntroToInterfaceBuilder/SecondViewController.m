//
//  SecondViewController.m
//  IntroToInterfaceBuilder
//
//  Created by Matthew Loseke on 9/18/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "SecondViewController.h"
#import "MAMLViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    // Do any additional setup after loading the view from its nib.
    _myViewTwoLabel.text = [NSString stringWithFormat: @"Hello %@", self.name];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backtoFirstView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // this would work as well
    
    /*
    MAMLViewController *mvc = [[MAMLViewController alloc] init];
    [self presentViewController:mvc animated:YES completion:nil];
    */
}
@end
