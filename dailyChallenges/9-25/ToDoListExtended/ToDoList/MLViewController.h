//
//  MLViewController.h
//  ToDoList
//
//  Created by Matthew Loseke on 9/24/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLEditCellViewController.h"

@interface MLViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, EditViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *todoArray;
@property (strong, nonatomic) UINavigationController *uinc;

- (IBAction)AddToDo:(id)sender;
@end