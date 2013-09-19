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
//@property (weak, nonatomic) UILabel
@end