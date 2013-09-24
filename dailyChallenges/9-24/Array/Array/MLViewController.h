//
//  MLViewController.h
//  Array
//
//  Created by Matthew Loseke on 9/24/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *buttonTf2L;
@property (strong, nonatomic) NSMutableArray *array;
- (IBAction)tf2L:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
