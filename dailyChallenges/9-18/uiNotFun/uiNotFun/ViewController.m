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

#pragma mark BUTTON CHANGE COLOR
    
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
    
    NSLog(@"%@", t);
    
    if ([t isEqualToString:@"on"]) {
        [_buttonOnAndOff setTitle:@"off" forState:UIControlStateNormal];
    } else {
        [_buttonOnAndOff setTitle:@"on" forState:UIControlStateNormal];
    }
}

@end






