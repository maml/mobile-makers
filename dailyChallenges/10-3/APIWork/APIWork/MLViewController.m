//
//  MLViewController.m
//  APIWork
//
//  Created by Matthew Loseke on 10/3/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize tableView, superHeroesArray;

- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"http://www.mobilemakers.co/lib/superheroes.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               
        superHeroesArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
                               
        [tableView reloadData];
    }];


    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return superHeroesArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier =@"abc";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    cell.textLabel.text = [(NSDictionary *) [superHeroesArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    return cell;

}

@end
