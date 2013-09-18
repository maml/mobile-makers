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
    
    _buttonColorChange = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_buttonColorChange setTitle:@"Change My Color" forState:UIControlStateNormal];
    [_buttonColorChange sizeToFit];
    
    [self.view addSubview:_buttonColorChange];
    
    //wire
    //[_buttonColorChange addTarget:self action:(SEL) forControlEvents:<#(UIControlEvents)#>]
    
    
    
}

-(IBAction)changeColor:(id)sender
{


}


@end
