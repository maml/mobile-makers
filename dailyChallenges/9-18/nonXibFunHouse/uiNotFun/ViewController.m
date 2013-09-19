//
//  ViewController.m
//  uiNotFun
//
//  Created by xcode on 9/18/13.
//  Copyright (c) 2013 xcode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Color change button
    _buttonColorChange = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_buttonColorChange setTitle:@"Change My Color" forState:UIControlStateNormal];
    [_buttonColorChange sizeToFit];
    [self.view addSubview:_buttonColorChange];
    
    // wire up color change button
    [_buttonColorChange addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];

    // Button to move and resize
    _buttonMoveAndResize = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_buttonMoveAndResize setTitle:@"Move & Resize Me" forState:UIControlStateNormal];
    [_buttonMoveAndResize setCenter:CGPointMake(0, 75.0)];
    [_buttonMoveAndResize sizeToFit];
    [self.view addSubview:_buttonMoveAndResize];
    
    // wire up move and resize button
    [_buttonMoveAndResize addTarget:self action:@selector(moveAndResize:) forControlEvents:UIControlEventTouchUpInside];
    
    // Button to toggle 'on' and 'off'
    _buttonOnAndOff = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_buttonOnAndOff setTitle:@"on" forState:UIControlStateNormal];
    [_buttonOnAndOff setCenter:CGPointMake(0, 150.0)];
    [_buttonOnAndOff sizeToFit];
    [self.view addSubview:_buttonOnAndOff];
    
    // wire up toggling of 'on' and 'off'
    [_buttonOnAndOff addTarget:self action:@selector(toggleOnAndOff:) forControlEvents:UIControlEventTouchUpInside];
    
    // Button for slider
    _mySlider = [[UISlider alloc] initWithFrame:CGRectMake(40.0, 225.0, 200, 40)];
    [self.view addSubview:_mySlider];
    
    // label for slider
    _sliderLabel = [[UILabel alloc] initWithFrame:CGRectMake(45.0, 260.0, 40, 30)];
    [_sliderLabel setText:@"0.0"];
    [_sliderLabel setBackgroundColor:[UIColor clearColor]];
    [_sliderLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:_sliderLabel];
    
    // wire up slide action
    [_mySlider addTarget:self action:@selector(slide:) forControlEvents:UIControlEventValueChanged];
    
    // Math!
    // -- operand1
    _operand1 = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 320.0, 20.0, 20.0)];
    [_operand1 setBackgroundColor:[UIColor lightGrayColor]];
    [_operand1 setTextColor:[UIColor whiteColor]];
    [_operand1 setText:@"3"];
    [_operand1 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_operand1];
    
    // -- the '+' sign
    _plusSign = [[UILabel alloc] initWithFrame:CGRectMake(35.0, 320.0, 20.0, 20.0)];
    [_plusSign setBackgroundColor:[UIColor clearColor]];
    [_plusSign setTextColor:[UIColor whiteColor]];
    [_plusSign setText:@"+"];
    [self.view addSubview:_plusSign];
    
    // -- operand2
    _operand2 = [[UILabel alloc] initWithFrame:CGRectMake(50.0, 320.0, 20.0, 20.0)];
    [_operand2 setBackgroundColor:[UIColor lightGrayColor]];
    [_operand2 setTextColor:[UIColor whiteColor]];
    [_operand2 setText:@"9"];
    [_operand2 setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_operand2];

    // -- equals sign
    _equalsSign = [[UILabel alloc] initWithFrame:CGRectMake(80.0, 320.0, 20.0, 20.0)];
    [_equalsSign setBackgroundColor:[UIColor clearColor]];
    [_equalsSign setTextColor:[UIColor whiteColor]];
    [_equalsSign setText:@"="];
    [self.view addSubview:_equalsSign];
    
    // -- the total
    _total = [[UILabel alloc] initWithFrame:CGRectMake(105.0, 320.0, 35.0, 20.0)];
    [_total setBackgroundColor:[UIColor lightGrayColor]];
    [_total setTextColor:[UIColor whiteColor]];
    [_total setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_total];
    
    // -- button 'Math!'
    _math = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_math setTitle:@"Math!" forState:UIControlStateNormal];
    [_math setCenter:CGPointMake(150.00, 320.0)];
    [_math sizeToFit];
    [self.view addSubview:_math];
    
    // -- wire up 'Math!'
    [_math addTarget:self action:@selector(compute:) forControlEvents:UIControlEventTouchUpInside];

    
    // Not Working ------
    // Image / Logo
    UIImage *z = [[UIImage alloc] initWithContentsOfFile: @"/Users/matt/Projects/mobile-makers/dailyChallenges/9-18-ii/YouEyeViewFunHouse/YouEyeViewFunHouse/MobileMakersLogo_black_and_white.png"];
    //[_myImageView setFrame:CGRectMake(50.0, 50.0, 200.0, 200.0)];
    [_myImageView setCenter:CGPointMake(75.0, 75.0)];
    [_myImageView setImage:z];
    //[_myImage sizeToFit];
    [self.view addSubview:_myImageView];

}

-(IBAction)changeColor:(id)sender
{
    self.view.backgroundColor = [UIColor grayColor];
}

-(IBAction)moveAndResize:(id)sender
{
    float currentX = _buttonMoveAndResize.frame.origin.x;
    float currentY = _buttonMoveAndResize.frame.origin.y;
    
    float currentH = _buttonMoveAndResize.frame.size.height;
    float currentW = _buttonMoveAndResize.frame.size.width;
    
    currentY += 10.0;
    currentW += 20.0;
    
    _buttonMoveAndResize.center = CGPointMake(currentX, currentY);
    
    [_buttonMoveAndResize setFrame: CGRectMake(currentX, currentY, currentW, currentH)];
}

-(IBAction)toggleOnAndOff:(id)sender
{
    NSString *t = [NSString stringWithFormat:@"%@", _buttonOnAndOff.titleLabel.text];
    
    if ([t isEqualToString:@"on"]) {
        [_buttonOnAndOff setTitle:@"off" forState:UIControlStateNormal];
    } else {
        [_buttonOnAndOff setTitle:@"on" forState:UIControlStateNormal];
    }
}

-(IBAction)slide:(id)sender
{
    float z = [_mySlider value];
    
    _sliderLabel.text = [NSString stringWithFormat:@"%.2f", z];

}

-(IBAction)compute:(id)sender
{
    NSString *z1 = [NSString stringWithFormat: @"%@",_operand1.text];
    NSString *z2 = [NSString stringWithFormat: @"%@",_operand2.text];
    
    //NSLog(z1);
    
    int z3 = [z1 intValue] + [z2 intValue];
    
    _total.text = [NSString stringWithFormat: @"%i", z3];

}
@end






