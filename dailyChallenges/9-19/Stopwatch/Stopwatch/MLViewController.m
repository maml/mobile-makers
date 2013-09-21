//
//  MLViewController.m
//  Stopwatch
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLTimer.h"

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
@property (weak, nonatomic) NSTimer *timer;
@property (nonatomic) int timerFireCount;
@property (nonatomic) NSString *secondsFormat;
@property (nonatomic) NSString *minutesFormat;
@property (nonatomic) NSString *hoursFormat;
@property (nonatomic) int tenths;
@property (nonatomic) int seconds;
@property (nonatomic) int minutes;
@property (nonatomic) int hours;
@property (nonatomic) BOOL startButtonState;

- (void)timerFired:(NSTimer *) theTimer;
- (void)displayTenths:(int) t;
- (void)displaySeconds:(int) s;
- (void)displayMinutes:(int) m;
- (void)displayHours:(int) h;
- (void)resetDisplay;
- (void)resetTimerProperties;
- (BOOL)disableStartButton;
- (BOOL)enableStartButton;

@end

@implementation MLViewController

@synthesize tenths, seconds, minutes, hours, timerFireCount, startButtonState;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _hoursLabel.text = @"00";
    _minutesLabel.text = @"00";
    _secondsLabel.text = @"00";
    [self enableStartButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    if (startButtonState == YES) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:YES];
    }
    // we want prevent multiple timers from running
    [self disableStartButton];
}

- (IBAction)pause:(id)sender {
    [self.timer invalidate];
    [self enableStartButton];
}

- (IBAction)stop:(id)sender {
    [self.timer invalidate];
    [self enableStartButton];
    [self resetDisplay];
    [self resetTimerProperties];

}

- (BOOL)enableStartButton {
    return startButtonState = YES;
}

- (BOOL)disableStartButton {
    return startButtonState = NO;
}

- (void)timerFired:(NSTimer *) timer
{
    timerFireCount++;
    
    if (tenths < 9) {
        tenths++;
    } else {
        tenths = 0;
    }
    
    if (timerFireCount % 10 == 0) {
        if (seconds < 59) {
            seconds++;
        } else {
            seconds = 0;
        }
    }
    
    // timer fires every tenth of a second
    // tenths/second * seconds/minute
    // 10 * 60 = 600 tenths/minute
    if (timerFireCount % 600 == 0) {
        if (minutes < 59) {
            minutes++;
        } else {
            minutes = 0;
        }
    }
    
    // tenths/second * seconds/minute * minutes/hour
    // 10 * 60 * 60 = 36,000 tenths/hour
    if (timerFireCount % 36000 == 0) {
        if (hours < 23) {
            hours++;
        } else {
            hours = 0;
        }
    }

    
    [self displayTenths:(tenths)];
    [self displaySeconds:(seconds)];
    [self displayMinutes:(minutes)];
    
}

- (void)resetDisplay {
    _tenthsLabel.text = @"0";
    _secondsLabel.text = @"00";
    _minutesLabel.text = @"00";
    _hoursLabel.text = @"00";
}

- (void)resetTimerProperties {
    tenths = 0;
    seconds = 0;
    minutes = 0;
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








