//
//  MLAddContactViewController.h
//   Core Data)
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLAddContactViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
- (IBAction)cancel:(id)sender;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *done;

@end
