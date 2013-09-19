//
//  ViewController.m
//  ViewFunHouse
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIImage *z = [[UIImage alloc] initWithContentsOfFile: @"/Users/matt/Projects/mobile-makers/dailyChallenges/9-18-ii/YouEyeViewFunHouse/YouEyeViewFunHouse/MobileMakersLogo_black_and_white.png"];
    [_myImage setImage:z];
}


- (IBAction)changeMyColor:(id)sender {
    
    self.view.backgroundColor = [UIColor redColor];
    
}

- (IBAction)colorize:(id)sender {
    UIImage *z = [[UIImage alloc] initWithContentsOfFile: @"/Users/matt/Projects/mobile-makers/dailyChallenges/9-18-ii/YouEyeViewFunHouse/YouEyeViewFunHouse/MobileMakersLogo_color.png"];
    [_myImage setImage:z];

    
    
}

- (IBAction)moveAndChange:(id)sender {
    
    float currentX = _moveAndChangeButton.frame.origin.x;
    float currentY = _moveAndChangeButton.frame.origin.y;
    
    float currentH = _moveAndChangeButton.frame.size.height;
    float currentW = _moveAndChangeButton.frame.size.width;
    
    currentY += 10.0;
    currentX -= 10.0;
    currentW += 20.0;
    
    _moveAndChangeButton.center = CGPointMake(currentX, currentY);
    
    [_moveAndChangeButton setFrame: CGRectMake(currentX, currentY, currentW, currentH)];
    
}

- (IBAction)buttonToggle:(id)sender {
    

    NSString *z = [NSString stringWithFormat:@"%@", _myButton.titleLabel.text];

    if ([z isEqualToString:@"On"])
    { z=@"off";}
    else {
    z = @"On";}
    [_myButton setTitle:z forState:UIControlStateNormal];
    
}

- (IBAction)sliderSetValue:(id)sender {
    
    float z = [_mySlider value];
    
    _sliderLabel.text = [NSString stringWithFormat:@"%.1f", z];
    
}

- (IBAction)compute:(id)sender {
    
    // to see property names, log property and see list of names/values
    
    NSString *z1 = [NSString stringWithFormat: @"%@",_textbox1.text];
    NSString *z2 = [NSString stringWithFormat: @"%@",_textbox2.text];
    
    //NSLog(z1);

    int z3 = [z1 intValue] + [z2 intValue];
    
    _textboxAnswer.text = [NSString stringWithFormat: @"%i", z3];
    
}
@end
