//
//  MLViewController.m
//  Stopwatch
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

// UI
@property (weak, nonatomic) IBOutlet UILabel *hoursLabel;
@property (weak, nonatomic) IBOutlet UILabel *minutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;
@property (weak, nonatomic) IBOutlet UILabel *tenthsLabel;
@property (weak, nonatomic) IBOutlet UILabel *separatorHoursAndMinutesLabel;
@property (weak, nonatomic) IBOutlet UILabel *separatorMinutesAndSecondsLabel;
@property (weak, nonatomic) IBOutlet UILabel *separatorSecondsAndTenthsLabel;
@property (weak, nonatomic) IBOutlet UIButton *buttonStart;
@property (weak, nonatomic) IBOutlet UIButton *buttonPause;
@property (weak, nonatomic) IBOutlet UIButton *buttonStop;
- (IBAction)start:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)stop:(id)sender;

// Timer
@property (nonatomic) NSString *secondsFormat;
@property (nonatomic) NSString *minutesFormat;
@property (nonatomic) NSString *hoursFormat;

- (void)displayTenths:(int) t;
- (void)displaySeconds:(int) s;
- (void)displayMinutes:(int) m;
- (void)displayHours:(int) h;
- (void)resetDisplay;
- (void)resetTimer;

@property (strong, nonatomic) MLStopwatch *stopwatch;

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleTick:)
     name:@"timerHasTicked"
     object:_stopwatch];
	
    // Do any additional setup after loading the view, typically from a nib.
    _hoursLabel.text = @"00";
    _minutesLabel.text = @"00";
    _secondsLabel.text = @"00";

    _stopwatch = [[MLStopwatch alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    if (_stopwatch.isStartable == YES) {
        [_stopwatch createScheduledTimerWithTimeInterval];
    }
    // we want prevent multiple timers from running
    [_stopwatch disableStartButton];
}

- (IBAction)pause:(id)sender {
    [[_stopwatch timer] invalidate];
    [_stopwatch enableStartButton];
}

- (IBAction)stop:(id)sender {
    [[_stopwatch timer] invalidate];
    [_stopwatch enableStartButton];
    [self resetDisplay];
    [self resetTimer];

}

- (void)handleTick:(NSNotification *) notification
{
    [self displayTenths:([_stopwatch tenths])];
    [self displaySeconds:([_stopwatch seconds])];
    [self displayMinutes:([_stopwatch minutes])];
    [self displayHours:([_stopwatch hours])];
}

- (void)resetDisplay {
    _tenthsLabel.text = @"0";
    _secondsLabel.text = @"00";
    _minutesLabel.text = @"00";
    _hoursLabel.text = @"00";
}

- (void)resetTimer {
    [_stopwatch reset];
}

- (void)displayTenths:(int)t
{
    _tenthsLabel.text = [NSString stringWithFormat:@"%d", t];
}

- (void)displaySeconds:(int)s
{
    if (s < 1) {
        _secondsFormat = @"00";
    } else if (s < 10){
        _secondsFormat = [NSString stringWithFormat:@"0%i", s];
    } else {
        _secondsFormat = [NSString stringWithFormat:@"%i", s];
    }
    _secondsLabel.text = _secondsFormat;
}

- (void)displayMinutes:(int)m
{
    if (m < 1) {
        _minutesFormat = @"00";
    } else if (m < 10){
        _minutesFormat = [NSString stringWithFormat:@"0%i", m];
    } else {
        _minutesFormat = [NSString stringWithFormat:@"%i", m];
    }
    _minutesLabel.text = _minutesFormat;
}

- (void)displayHours:(int)h {
    if (h < 1) {
        _hoursFormat = @"00";
    } else if (h < 24) {
        _hoursFormat = [NSString stringWithFormat:@"0%i", h];
    } else {
        _hoursFormat = [NSString stringWithFormat:@"%i", h];
    }
}

@end








