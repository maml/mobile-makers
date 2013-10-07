//
//  MLViewController.m
//  App.net
//
//  Created by Matthew Loseke on 10/6/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize tableView, samplePosts, objectForCell, titleAndUsernameDictionary;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadAppNetData];
}

- (UITableViewCell *)tableView:(UITableView *)_tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier =@"abc";
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
   
    NSDictionary *dict = [objectForCell objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dict objectForKey:@"text"];
    cell.detailTextLabel.text = [dict objectForKey:@"username"];
 
    NSURL *url = [NSURL URLWithString:[dict objectForKey:@"avatar_image"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        UIImage *image = [UIImage imageWithData:data];
        cell.imageView.image = image;
        [tableView reloadData];
    }];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return objectForCell.count;
}

- (void)loadAppNetData
{
    NSURL *url = [NSURL URLWithString: @"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

                               samplePosts = [ NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
                               objectForCell = [[NSMutableArray alloc] init];
                               NSMutableArray *dataArray = samplePosts[@"data"];
                               
                               for (NSDictionary *dict in dataArray) {
                                   
                                   NSEnumerator *enumerator = [dict keyEnumerator];
                                   id key;
                                   NSMutableDictionary *dictToAddToArray = [[NSMutableDictionary alloc] init];
                                   
                                   while ((key = [enumerator nextObject])) {
                                       
                                       if ([key isEqual: @"text"]) {
                                          
                                           NSString *text = [dict objectForKey:key];
                                           [dictToAddToArray setObject:text forKey:@"text"];
                                       }
                                       
                                       if ([key isEqual: @"user"]) {
                                           NSString *username = dict[key][@"username"];
                                           [dictToAddToArray setObject:username forKey:@"username"];
                                           
                                           NSString *avatarImageURL = dict[key][@"avatar_image"][@"url"];
                                           [dictToAddToArray setObject:avatarImageURL forKey:@"avatar_image"];
                                       }
           
                                   }
                                   
                                   [objectForCell addObject:dictToAddToArray];
                                  
                                   //[spinner stopAnimating];
                                   //[tableView setHidden:NO];
                                  
                                   [tableView reloadData];
                               }
                               
                           }];
}

@end






