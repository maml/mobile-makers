//
//  MLSecondViewController.m
//  Storyboard
//
//  Created by Matthew Loseke on 9/30/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLSecondViewController.h"
#import "MLThirdViewController.h"

@interface MLSecondViewController ()

@end

@implementation MLSecondViewController

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
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)navigate:(id)sender
{
    [self performSegueWithIdentifier:@"MySegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MLThirdViewController *thirdViewController = segue.destinationViewController;
    [thirdViewController setMyLabelName:@"Mammallian Purrsuits"];    
}

@end
