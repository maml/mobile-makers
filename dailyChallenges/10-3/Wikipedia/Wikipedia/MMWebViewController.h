//
//  MMWebViewController.h
//  Wikipedia
//
//  Created by Matthew Loseke on 10/4/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMWebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) NSURL *url;

@end
