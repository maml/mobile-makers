//
//  MLWordDetailsViewController.m
//  Word Browser
//
//  Created by Matthew Loseke on 10/2/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLWordDetailsViewController.h"
#import "MLWord.h"

@interface MLWordDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *definitionTextView;
@property (weak, nonatomic) IBOutlet UILabel *synonymsLabel;

@end

@implementation MLWordDetailsViewController

@synthesize definition, key, synonymsText, synonymsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _nameLabel.text = key;
    _definitionTextView.text = definition;
    _synonymsLabel.text = [self synonymsArray2Text];
}

- (NSString *)synonymsArray2Text
{
    NSString *synonyms = @"";
    
    for (MLWord *word in synonymsArray) {
        synonyms = [synonyms stringByAppendingString:[NSString stringWithFormat:@"%@ ", word.name]];
    }
    return synonyms;
}

@end




