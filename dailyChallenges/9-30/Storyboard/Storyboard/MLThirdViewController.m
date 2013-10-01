//
//  MLThirdViewController.m
//  Storyboard
//
//  Created by Matthew Loseke on 9/30/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLThirdViewController.h"

@interface MLThirdViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@end

@implementation MLThirdViewController

@synthesize myLabelName;

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
    _myLabel.text = myLabelName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
