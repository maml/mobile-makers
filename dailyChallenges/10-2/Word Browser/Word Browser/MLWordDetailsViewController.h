//
//  MLWordDetailsViewController.h
//  Word Browser
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLWord.h"

@interface MLWordDetailsViewController : UIViewController

@property (strong, nonatomic) NSString *definition;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSArray *synonymsArray;
@property (strong, nonatomic) NSString *synonymsText;

@end
