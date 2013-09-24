//
//  MLTimerViewController.m
//  Stopwatch
//
//  Created by Matthew Loseke on 9/23/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLTimerViewController.h"
#import "MLViewController.h"

@interface MLTimerViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonStopwatch;
@property (weak, nonatomic) IBOutlet UITextField *textFieldMinutes;
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;
@property (weak, nonatomic) IBOutlet UILabel *separatorHoursAndMinutes;
@property (weak, nonatomic) IBOutlet UILabel *separatorMinutesAndSeconds;
@property (weak, nonatomic) IBOutlet UIButton *buttonStart;

- (IBAction)start:(id)sender;

- (IBAction)showStopwatch:(id)sender;

@end

@implementation MLTimerViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    NSLog(@"start the timer");
    
    // get the minutes entered
    NSLog(@"The minutes entered were %i\n", [_textFieldMinutes.text intValue]);
    // calulate hours and minutes
    int minutes = [_textFieldMinutes.text intValue];
    NSLog(@"321 minutes divided by 60 yields . . . %i\n", (321 / 60));
    
    // if minutes / 60 < 1
    //  less than an hour, just deal with minutes
    // else
    //
    
    // update interface
    // start timer
    // update interface on every timer click
}

- (IBAction)showStopwatch:(id)sender {
    MLViewController *mlvc = [[MLViewController alloc] init];
    [self presentViewController:mlvc animated:YES completion:nil];
}

@end
