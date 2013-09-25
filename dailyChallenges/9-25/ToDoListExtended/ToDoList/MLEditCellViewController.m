//
//  MLEditCellViewController.m
//  ToDoList
//
//  Created by Matthew Loseke on 9/24/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLEditCellViewController.h"
#import "MLViewController.h"

@interface MLEditCellViewController ()

@end

@implementation MLEditCellViewController

@synthesize delegate, passedText, index;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textFieldOfEditableContent.text = passedText;
}

- (IBAction)update:(id)sender {
    [delegate editViewController:self didEdit:_textFieldOfEditableContent.text index:index];
}
@end
