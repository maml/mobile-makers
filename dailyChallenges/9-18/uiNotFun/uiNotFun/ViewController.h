//
//  ViewController.h
//  uiNotFun
//
//  Created by xcode on 9/18/13.
//  Copyright (c) 2013 xcode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Color change button
@property (weak, nonatomic) UIButton *buttonColorChange;
-(IBAction)changeColor:(id)sender;

// Resize and move button
@property (weak, nonatomic) UIButton *buttonMoveAndResize;
-(IBAction)moveAndResize:(id)sender;

// Button that displays 'on' or 'off'
@property (weak, nonatomic) UIButton *buttonOnAndOff;
-(IBAction)toggleOnAndOff:(id)sender;

// Slider
@property (strong, nonatomic) UISlider *mySlider;
@property (strong, nonatomic) UILabel *sliderLabel;
-(IBAction)slide:(id)sender;

// Additon - Math!
@property (strong, nonatomic) UILabel *operand1;
@property (strong, nonatomic) UILabel *plusSign;
@property (strong, nonatomic) UILabel *operand2;
@property (strong, nonatomic) UILabel *equalsSign;
@property (strong, nonatomic) UILabel *total;
@property (strong, nonatomic) UIButton *math;
-(IBAction)compute:(id)sender;

@end