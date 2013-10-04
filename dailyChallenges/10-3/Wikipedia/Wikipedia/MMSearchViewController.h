//
//  MMSearchViewController.h
//  Wikipedia
//
//  Created by Hammad  on 10/3/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) NSString *searchTerm;
@property (strong, nonatomic) NSMutableDictionary *searchResults;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *titlesForTable;


@end
