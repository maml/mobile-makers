//
//  MLViewController.m
//  BlocksChallenge
//
//  Created by Matthew Loseke on 10/1/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize filteredNumbers;

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSLog(@"we got to the next controller");
    NSLog(@"filtered set of numbers is %@", filteredNumbers);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [filteredNumbers count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier =@"abc";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text =  [[filteredNumbers objectAtIndex:indexPath.row] description];
    
    return cell;
}

@end
