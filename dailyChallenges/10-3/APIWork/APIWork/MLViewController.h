//
//  MLViewController.h
//  APIWork
//
//  Created by Matthew Loseke on 10/3/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *superHeroesArray;

@end
