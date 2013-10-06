//
//  MMViewController.m
//  Wikipedia
//
//  Created by Hammad  on 10/3/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import "MMViewController.h"
#import "MMSnippetViewController.h"

@interface MMViewController ()

@end

@implementation MMViewController

@synthesize searchURL, searchResults, titlesForTable, tableView, searchBar, titleOfSelected, spinner;

- (void)viewDidLoad
{
    [super viewDidLoad];
    searchBar.placeholder = @"enter search term";
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)_searchBar
{
    [self setSearchURL: _searchBar.text];
    [self search];
    [self.view endEditing:YES];
    
    [tableView setHidden:YES];
    [spinner startAnimating];
}

- (void)setSearchURL:(NSString *)searchTerm
{
    NSString *urlString1 = @"https://en.wikipedia.org/w/api.php?%20action=query&list=search&srsearch=";
    NSString *urlString2 = [NSString stringWithFormat:@"%@", searchTerm];
    NSString *urlString3 = @"&srprop=snippet&format=json";
    
    NSString *urlPart1 = [urlString1 stringByAppendingString:urlString2];
    NSString *urlWhole = [urlPart1 stringByAppendingString:urlString3];
    
    NSLog(@"%@", urlWhole);
    searchURL = urlWhole;
}

- (void)search
{
    NSURL *url = [NSURL URLWithString: searchURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               searchResults = [ NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
                               
                               titlesForTable = [[NSMutableArray alloc] init];
                               NSMutableArray *searchResultsArray = searchResults[@"query"][@"search"];
                               
                               for (NSDictionary *dict in searchResultsArray) {
                                   
                                   NSEnumerator *enumerator = [dict keyEnumerator];
                                   id key;
                                   
                                   while ((key = [enumerator nextObject])) {
                                       
                                       if ([key isEqual: @"title"]) {
                                           
                                           NSString *title = [dict objectForKey:key];
                                           
                                           [titlesForTable addObject:title];
                                           
                                       }
                                   }
                                   [spinner stopAnimating];
                                   [tableView setHidden:NO];
                                   [tableView reloadData];
                               }
                           }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
    cell.textLabel.text = [titlesForTable objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titlesForTable.count;
}

// this *should* be automatic with a prototype cell but not working for some reason
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    titleOfSelected = [titlesForTable objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showSnippet" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MMSnippetViewController *vc = segue.destinationViewController;
    
    for (NSDictionary *dict in (NSArray *)searchResults[@"query"][@"search"]) {
        
        NSEnumerator *enumerator = [dict keyEnumerator];
        id key;
        
        while ((key = [enumerator nextObject])) {
            
            if ([key isEqual: @"title"]) {
                
                // this is the value of the current object being iterated through's title
                NSString *title = [dict objectForKey:key];
                
                // compare the selected title to the one we just assigned to title
                // if they're equal, we've found our object of interest and need to look up
                // its snippet
                if ([titleOfSelected isEqualToString:title]) {
                    NSString *snippet = [dict objectForKey:@"snippet"];
                    vc.snippet = snippet;
                    vc.wikipediaTitle = titleOfSelected;
                }
                
            }
        }
    }
}

@end

















