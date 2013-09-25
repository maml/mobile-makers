//
//  MLEditViewController.h
//  MyFavoriteThings
//
//  Created by Matthew Loseke on 9/25/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditViewControllerDelegate
-(void)editViewController: (id)evc didEdit: (NSString *)text index: (int) index;
@end



@interface MLEditViewController : UIViewController
@property (strong, nonatomic) id <EditViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property int index;
@property (strong, nonatomic) NSString *passedText;

- (IBAction)endEditingWithButton:(id)sender;

@end
