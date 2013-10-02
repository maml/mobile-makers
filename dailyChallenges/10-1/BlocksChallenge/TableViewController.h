//
//  TableViewController.h
//  BlocksChallenge
//
//  Created by Matthew Loseke on 10/1/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *oddButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *evenButton;

@property (strong, nonatomic) NSMutableArray *originalSetOfNumbers;
@property (strong, nonatomic) NSMutableArray *filteredSetOfNumbers;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
