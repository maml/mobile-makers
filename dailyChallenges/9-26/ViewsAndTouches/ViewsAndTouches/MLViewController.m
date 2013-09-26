//
//  MLViewController.m
//  ViewsAndTouches
//
//  Created by Matthew Loseke on 9/26/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[MLmyView class]]) {
            MLmyView *myView = (MLmyView *) view;
            myView.delegate = self;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didChooseView:(UIView *)view
{
    NSLog(@"Tag is %i", (int)view.tag);
}

@end
