//
//  MMSearchViewController.m
//  Wikipedia
//
//  Created by Hammad  on 10/3/13.
//  Copyright (c) 2013 Hammad Ahmed. All rights reserved.
//

#import "MMSearchViewController.h"

@interface MMSearchViewController ()

@end

@implementation MMSearchViewController
@synthesize searchTerm;
@synthesize searchResults;
@synthesize titlesForTable;


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
    titlesForTable = [[NSMutableArray alloc] init];
    
    NSString *urlString1 = @"https://en.wikipedia.org/w/api.php?%20action=query&list=search&srsearch=";
    NSString *urlString2 = [NSString stringWithFormat:@"%@", searchTerm];
    NSString *urlString3 = @"&srprop=snippet&format=json";
    
    NSString *urlPart1 = [urlString1 stringByAppendingString:urlString2];
    NSString *urlWhole = [urlPart1 stringByAppendingString:urlString3];
    
    NSLog(@"%@", urlWhole);
    
    
    NSURL *url = [NSURL URLWithString: urlWhole];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               searchResults = [ NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
                               
                               // working with our wack JSON repsonse here . . .
                               NSMutableDictionary *queryDictionary = [searchResults objectForKey:@"query"];
                               NSMutableArray *searchResultsArray = [queryDictionary objectForKey:@"search"];
                               
                               //NSLog(@"searchResultsArray is %@", searchResultsArray);
                               
                               for (NSDictionary *dict in searchResultsArray) {
                                   //NSLog(@"dict is %@", dict);
                                   
                                   NSEnumerator *enumerator = [dict keyEnumerator];
                                   id key;
                                   
                                   while ((key = [enumerator nextObject])) {
                                       NSLog(@"key is %@", key);
                                       NSLog(@"object is %@", [dict objectForKey:key]);
                                       
                                       if ([key isEqual: @"title"]) {

                                           NSString *title = [dict objectForKey:key];
                                           
                                           [titlesForTable addObject:title];
                                       
                                       }
                                   }
                                   NSLog(@"titles are %@", titlesForTable);
                                   [_tableView reloadData];
                               }
                           }];
    
    //[_tableView reloadData];
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titlesForTable.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
    
    cell.textLabel.text = [titlesForTable objectAtIndex:indexPath.row];
    
    return cell;
}

@end




















