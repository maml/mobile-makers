//
//  EditViewController.h
//  MMPersistanceScaffold
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperHero.h"

@interface EditViewController : UIViewController

@property (strong, nonatomic) SuperHero *hero;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextView *bioText;
- (IBAction)saveUpdatedHero:(id)sender;

@end
