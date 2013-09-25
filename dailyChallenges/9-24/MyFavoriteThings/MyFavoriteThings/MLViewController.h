//
//  MLViewController.h
//  MyFavoriteThings
//
//  Created by Matthew Loseke on 9/24/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLEditViewController.h"

@interface MLViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, EditViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *array;
- (IBAction)addToTable:(id)sender;

@end
