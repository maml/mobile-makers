//
//  MMSnippetViewController.h
//  Wikipedia
//
//  Created by Matthew Loseke on 10/3/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMSnippetViewController : UIViewController

@property (weak, nonatomic) NSString *snippet;
@property (weak, nonatomic) IBOutlet UITextView *snippetTextView;

@end
