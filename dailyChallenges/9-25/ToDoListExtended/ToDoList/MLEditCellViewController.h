//
//  MLEditCellViewController.h
//  ToDoList
//
//  Created by Matthew Loseke on 9/24/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditViewControllerDelegate
-(void)editViewController: (id)evc didEdit: (NSString *)text index: (int) index;
@end

@interface MLEditCellViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldOfEditableContent;
@property (weak, nonatomic) IBOutlet UIButton *buttonUpdate;
- (IBAction)update:(id)sender;

@property (strong, nonatomic) id <EditViewControllerDelegate> delegate;
@property (strong, nonatomic) NSString *passedText;
@property int index;

@end
