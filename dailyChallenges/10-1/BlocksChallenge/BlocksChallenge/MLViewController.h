//
//  MLViewController.h
//  BlocksChallenge
//
//  Created by Matthew Loseke on 10/1/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *filteredNumbers;

@end
