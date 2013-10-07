//
//  MLViewController.h
//  App.net
//
//  Created by Matthew Loseke on 10/6/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) NSMutableDictionary *samplePosts;
@property (weak, nonatomic) NSMutableDictionary *titleAndUsernameDictionary;

@property (strong, nonatomic) NSMutableArray *objectForCell;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
