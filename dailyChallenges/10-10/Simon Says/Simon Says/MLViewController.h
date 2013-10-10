//
//  MLViewController.h
//  Simon Says
//
//  Created by Matthew Loseke on 10/10/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLViewController : UIViewController

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSMutableDictionary *views;
@property int i;

@end
