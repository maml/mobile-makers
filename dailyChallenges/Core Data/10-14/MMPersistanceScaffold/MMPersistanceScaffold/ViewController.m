//
//  ViewController.m
//  MMPersistanceScaffold
//
//  Created by Don Bora on 6/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak IBOutlet UITableView *oTableView;
    NSArray* people;
    NSFileManager *fileManager;
    NSURL *documentDirectory;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    fileManager = [NSFileManager defaultManager];
    documentDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSLog(@"Documents directory is: %@", documentDirectory);

    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"Has Data"])
    {
        NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"]];
        [NSURLConnection sendAsynchronousRequest:urlRequest
                                           queue:[NSOperationQueue currentQueue]
                               completionHandler:
         ^(NSURLResponse* response, NSData* data, NSError* error)
         {
             people = (NSArray*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
             [people writeToURL:[documentDirectory URLByAppendingPathComponent:@"people.plist"] atomically:YES];
             
             for (NSDictionary *dictionary in people) {
                 NSURL *url = [NSURL URLWithString:[dictionary valueForKey:@"avatar_url"]];
                 NSString *imageFileName = [[url pathComponents] lastObject];
                 NSURL *localImageUrl = [documentDirectory URLByAppendingPathComponent:imageFileName];
                 
                 NSData *imageData = [NSData dataWithContentsOfURL:url];
                 [imageData writeToURL:localImageUrl atomically:YES];
             }
             [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Has Data"];
             [[NSUserDefaults standardUserDefaults] synchronize];
             [oTableView reloadData];
         }];
    } else {
        people = [NSArray arrayWithContentsOfURL:[documentDirectory URLByAppendingPathComponent:@"people.plist"]];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UITableViewDataSouce

-(int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [people count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* tableViewCell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Superhero" forIndexPath:indexPath];
    
    NSURL *url = [NSURL URLWithString:[(NSDictionary *)[people objectAtIndex:indexPath.row] valueForKey:@"avatar_url"]];
    NSString *imageFileName = [[url pathComponents] lastObject];
    NSURL *localImageUrl = [documentDirectory URLByAppendingPathComponent:imageFileName];
    NSData *imageData = [NSData dataWithContentsOfURL:localImageUrl];
    
    tableViewCell.textLabel.text = [((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"name"];
    tableViewCell.detailTextLabel.text = [((NSDictionary*)[people objectAtIndex:indexPath.row]) valueForKey:@"description"];
    tableViewCell.imageView.image = [UIImage imageWithData:imageData];

    return tableViewCell;
}


@end
