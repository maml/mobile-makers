//
//  MLWordDetailsViewController.h
//  Word Browser
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLWord.h"

@interface MLWordDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *definitionTextView;
@property (weak, nonatomic) IBOutlet UITableView *synonymTableView;

@property (strong, nonatomic) NSString *definition;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSArray *synonymsArray;

@end
