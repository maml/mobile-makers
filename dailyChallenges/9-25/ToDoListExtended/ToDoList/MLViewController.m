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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_todoArray removeObjectAtIndex:indexPath.row];
        [_tableView reloadData];
    }
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // instantiate
    // delegatize
    // set props (passedText and index)
    // push to navigation controller
    
    MLEditCellViewController *mlevc = [[MLEditCellViewController alloc] init];
    mlevc.delegate = self;
    mlevc.index = indexPath.row;
    mlevc.passedText = _todoArray[indexPath.row];
    [self.navigationController pushViewController:mlevc animated:YES];
}

-(void)editViewController:(id)evc didEdit:(NSString *)text index:(int)index
{
    // update the todos array
    // reload the data
    // pop navigation controller
    
    _todoArray[index] = text;
    [_tableView reloadData];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)AddToDo:(id)sender {
    [_todoArray addObject:self.textField.text];
    [_textField resignFirstResponder];
    [_tableView reloadData];
    _textField.text = @"";
}
@end
