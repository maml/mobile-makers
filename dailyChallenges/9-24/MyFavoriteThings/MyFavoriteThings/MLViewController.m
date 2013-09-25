//
//  MLViewController.m
//  MyFavoriteThings
//
//  Created by Matthew Loseke on 9/24/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLEditViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.array = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"abc";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MLEditViewController *mlevc = [[MLEditViewController alloc] init];
    mlevc.delegate = self;
    mlevc.index = indexPath.row;
    mlevc.passedText = self.array[indexPath.row];
    [self.navigationController pushViewController:mlevc animated:YES];
}

- (IBAction)addToTable:(id)sender {
    [self.array addObject:self.textField.text];
    [self.textField resignFirstResponder];
    [self.tableView reloadData];
    self.textField.text = @"";
}

- (void)editViewController:(MLEditViewController *)evc didEdit:(NSString *)text index:(int)index
{
    self.array[index] = text;
    [[self tableView] reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
