//
//  MLEditViewController.m
//  MyFavoriteThings
//
//  Created by Matthew Loseke on 9/25/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLEditViewController.h"

@interface MLEditViewController ()

@end

@implementation MLEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _textField.text = _passedText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)endEditingWithButton:(id)sender {
    [_delegate editViewController:self didEdit:_textField.text index:_index];
}
@end
