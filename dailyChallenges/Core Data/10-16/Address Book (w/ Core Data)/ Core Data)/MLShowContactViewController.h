//
//  MLShowContactViewController.h
//   Core Data)
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface MLShowContactViewController : UIViewController


@property (strong, nonatomic) Contact *contact;
@property (strong, nonatomic) IBOutlet UILabel *contactNumber;
@property (strong, nonatomic) IBOutlet UILabel *contactName;

@end
