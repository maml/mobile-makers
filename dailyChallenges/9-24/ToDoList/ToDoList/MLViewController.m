//
//  MLViewController.m
//  ToDoList
//
//  Created by Matthew Loseke on 9/24/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLEditCellViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.todoArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// Number of sections is one: todo's
	return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"todo's";
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.todoArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"abc";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.todoArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    MLEditCellViewController *mlevc = [[MLEditCellViewController alloc] init];
    [mlevc setCell:[tableView cellForRowAtIndexPath:indexPath]];
    [self presentViewController:mlevc animated:YES completion:nil];
}

- (IBAction)AddToDo:(id)sender {
    [self.todoArray addObject:self.textField.text];
    [self.textField resignFirstResponder];
    [self.tableView reloadData];
    self.textField.text = @"";
}
@end
