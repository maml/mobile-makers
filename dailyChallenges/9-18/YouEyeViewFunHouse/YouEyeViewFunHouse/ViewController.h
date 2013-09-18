//
//  ViewController.h
//  ViewFunHouse
//
//  Created by keith Alperin on 4/30/13.
//  Copyright (c) 2013 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *colorChangeButton;
@property (weak, nonatomic) IBOutlet UIButton *moveAndChangeButton;

- (IBAction)changeMyColor:(id)sender;
- (IBAction)moveAndChange:(id)sender;

@end
