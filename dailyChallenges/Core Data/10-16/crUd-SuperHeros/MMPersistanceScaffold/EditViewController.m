//
//  EditViewController.m
//  MMPersistanceScaffold
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "EditViewController.h"
#import "AppDelegate.h"

@interface EditViewController ()

@end

@implementation EditViewController

@synthesize hero, nameTextField, bioText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    nameTextField.text = hero.name;
    bioText.text = hero.bio;
}

- (IBAction)saveUpdatedHero:(id)sender {
    hero.name = nameTextField.text;
    hero.bio = bioText.text;
    [[UIApplication moc] save:nil];
    //[self resignFirstResponder];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardWillShow) name:UIKeyboardWillShowNotification object:nil];
}

- (void)onKeyboardWillShow
{
    [UIView animateWithDuration:0.3f animations:^{
        /*
        CGAffineTransform t = CGAffineTransformMakeRotation(M_PI);
        t = CGAffineTransformScale(t, 0.5, 0.5);
        bioText.transform = t;
         */
    }];
}
@end
