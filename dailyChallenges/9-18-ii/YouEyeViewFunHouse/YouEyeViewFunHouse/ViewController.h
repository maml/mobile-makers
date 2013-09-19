//
//  ViewController.h
//  ViewFunHouse
//
//  Created by Matthew Loseke on 4/30/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *changeMyColor;

@property (weak, nonatomic) IBOutlet UISlider *mySlider;

@property (weak, nonatomic) IBOutlet UIButton *moveAndChangeButton;

@property (weak, nonatomic) IBOutlet UIButton *colorChangeButton;
@property (weak, nonatomic) IBOutlet UIButton *myButton;

@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UILabel *textbox1;
@property (weak, nonatomic) IBOutlet UILabel *textbox2;
@property (weak, nonatomic) IBOutlet UILabel *textboxAnswer;
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property (weak, nonatomic) IBOutlet UIImageView *logoView;

- (IBAction)changeMyColor:(id)sender;
- (IBAction)colorize:(id)sender;

- (IBAction)moveAndChange:(id)sender;
- (IBAction)buttonToggle:(id)sender;
- (IBAction)sliderSetValue:(id)sender;
- (IBAction)compute:(id)sender;

@end
