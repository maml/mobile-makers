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
}


- (IBAction)changeMyColor:(id)sender {
    // update bg color here . . .
    self.view.backgroundColor = [UIColor purpleColor];
    [_colorChangeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

- (IBAction)moveAndChange:(id)sender {

    float currentX = _moveAndChangeButton.frame.origin.x;
    float currentY = _moveAndChangeButton.frame.origin.y;
    
    float currentH = _moveAndChangeButton.frame.size.height;
    float currentW = _moveAndChangeButton.frame.size.width;
    
    currentY += 10.0;
    currentW -= 20.0;
    
    _moveAndChangeButton.center = CGPointMake(currentX, currentY);

    [_moveAndChangeButton setFrame: CGRectMake(currentX, currentY, currentW, currentH)];
}
@end
