//
//  ViewController.m
//  RockPaperScissors
//
//  Created by Don Bora on 4/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Judge.h"
#import "ComputerHand.h"

@interface ViewController ()
{
    NSTimer*                timer;
    int                     count;
    

    __weak IBOutlet UILabel *countDownLabel;
    __weak IBOutlet UILabel *computerHandLabel;
    __weak IBOutlet UILabel *playerHandLabel;
}
- (IBAction)start:(id)sender;
- (IBAction)rock:(id)sender;
- (IBAction)paper:(id)sender;
- (IBAction)scissors:(id)sender;
@end

@implementation ViewController

-(void)showWinner
{
    BOOL computerWon;
    
    // replace the YES with a call to your custom Judge class
    computerWon = NO;
    
    if (computerWon) {
        computerHandLabel.backgroundColor = [UIColor greenColor];
    }
    else{
        playerHandLabel.backgroundColor = [UIColor greenColor];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    //choices = @[@"rock", @"paper", @"scissors"];
    count = 3;
    [self updateCount];
    
    Judge *j = [[Judge alloc] init];
    BOOL returnVal = [j didComputerWin:@"rock" userString:@"scissors"];
    NSLog(@"did the computer win? - %i", returnVal);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateCount
{
    countDownLabel.text = [NSString stringWithFormat:@"%i", count];
}


-(void)countDown
{
    count--;
    [self updateCount];
    
    if (count == 0) {
        [timer invalidate];
        count = 4;
        ComputerHand *ch = [[ComputerHand alloc] init];
        computerHandLabel.text = [ch computerChoice];
    }
}


- (IBAction)start:(id)sender
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    playerHandLabel.backgroundColor = [UIColor whiteColor];
    computerHandLabel.backgroundColor = [UIColor whiteColor];

}

- (IBAction)rock:(id)sender
{
    playerHandLabel.text = @"rock";
    [self showWinner];
}

- (IBAction)paper:(id)sender
{
    playerHandLabel.text = @"paper";
    [self showWinner];
}

- (IBAction)scissors:(id)sender
{
    playerHandLabel.text = @"scissors";
    [self showWinner];
}


@end
