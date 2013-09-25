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

@synthesize cell;

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
    self.textFieldOfEditableContent.text = [NSString stringWithFormat:@"%@", cell.textLabel.text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)update:(id)sender {
    cell.textLabel.text = self.textFieldOfEditableContent.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
