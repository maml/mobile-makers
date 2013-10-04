//
//  MMViewController.h
//  Wikipedia
//
//  Created by Hammad  on 10/3/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) NSString *searchURL;
@property (strong, nonatomic) NSMutableDictionary *searchResults;
@property (strong, nonatomic) NSMutableArray *titlesForTable;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) NSString *titleOfSelected;

@end
