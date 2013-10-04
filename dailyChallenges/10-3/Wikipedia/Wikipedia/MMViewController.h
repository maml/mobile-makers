//
//  MMViewController.h
//  Wikipedia
//
//  Created by Hammad  on 10/3/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *searchTermTextField;
- (IBAction)searchButton:(id)sender;

@end
