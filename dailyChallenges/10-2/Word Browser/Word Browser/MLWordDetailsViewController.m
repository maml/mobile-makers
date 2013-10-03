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

@end

@implementation MLWordDetailsViewController

@synthesize definition, key, synonymsArray;

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
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier =@"abc";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    MLWord *word = synonymsArray[indexPath.row];
    cell.textLabel.text = word.name;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return synonymsArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Synonyms";
}

@end




