//
//  ViewController.h
//  AddressBook
//
//  Created by Agnt86 on 9/30/13.
//  Copyright (c) 2013 Agnt86. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) NSMutableArray *people;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property int indexOfSelectedPerson;
@property (strong, nonatomic) NSFileManager *fileManager;
@property (strong, nonatomic) NSURL *documentDirectory;

@end
