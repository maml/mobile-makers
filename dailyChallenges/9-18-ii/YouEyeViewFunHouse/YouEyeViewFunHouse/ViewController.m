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

    UIImage *z = [[UIImage alloc] initWithContentsOfFile: @"/Users/code/Desktop/git/YouEyeViewFunHouse/MobileMakersLogo_black_and_white.png"];
    [_myImage setImage:z];
}


- (IBAction)changeMyColor:(id)sender {
    
    self.view.backgroundColor = [UIColor redColor];
    
}

- (IBAction)colorize:(id)sender {
    UIImage *z = [[UIImage alloc] initWithContentsOfFile: @"/Users/code/Desktop/git/YouEyeViewFunHouse/MobileMakersLogo_color.png"];
    [_myImage setImage:z];

    
    
}

- (IBAction)moveAndChange:(id)sender {
    
 //   option 1:
 //   float x = _moveAndChangeButton.center.x;
 //   float y = _moveAndChangeButton.center.y;    
    
 //   _moveAndChangeButton.center = CGPointMake(x,y);  
    
    
    

    
    // best approach is to just redraw it USE FRAME
    
    //origin = x, y left corner
    float x = _moveAndChangeButton.frame.origin.x; 
    float y = _moveAndChangeButton.frame.origin.y + 100;    

    float wd = _moveAndChangeButton.frame.size.width;
    float ht = _moveAndChangeButton.frame.size.height +100;

    
   
    
    [_moveAndChangeButton setFrame: CGRectMake(x,y,wd,ht)];

    
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
