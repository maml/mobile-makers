//
//  ViewController.m
//  MMPersistanceScaffold
//
//  Created by Don Bora on 6/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SuperHero.h"

@interface ViewController ()
{
    __weak IBOutlet UITableView *oTableView;
    NSArray* people;
    
    NSFileManager *fileManager;
    NSURL *documentsDirectory;
}

@end

@implementation ViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        fileManager = [NSFileManager defaultManager];
        documentsDirectory = [[fileManager URLsForDirectory:NSDocumentDirectory
                                                  inDomains:NSUserDomainMask] lastObject];
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    NSManagedObjectContext *moc = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];

    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasData"])
    {
        NSURLRequest* urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"]];

        [NSURLConnection sendAsynchronousRequest:urlRequest
                                           queue:[NSOperationQueue currentQueue]
                               completionHandler:
         ^(NSURLResponse* response, NSData* data, NSError* error)
         {
             NSArray *JSON = (NSArray *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
           
             for (NSDictionary *dictionary in JSON) {
                 NSURL *url = [NSURL URLWithString:[dictionary valueForKey:@"avatar_url"]];
                 NSString *imageFileName = [[url pathComponents] lastObject];
                 NSURL *localImageUrl = [documentsDirectory URLByAppendingPathComponent:imageFileName];
                 
                 NSData *imageData  = [NSData dataWithContentsOfURL:url];
                 [imageData writeToURL:localImageUrl atomically:YES];
                
                 SuperHero *hero = [NSEntityDescription insertNewObjectForEntityForName:@"SuperHero" inManagedObjectContext:moc];
                 hero.name = [dictionary objectForKey:@"name"];
                 hero.email = [dictionary objectForKey:@"description"];
                 hero.image = localImageUrl.absoluteString;
             }

             NSError *err;
             if (![moc save:&err]) {
                 NSLog(@"failed to save");
             }

             [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasData"];
             [[NSUserDefaults standardUserDefaults] synchronize];
             [self fetchFromCoreData];
             [oTableView reloadData];
         }];
        
    }
    else
    {
        [self fetchFromCoreData];
    }
}

- (void)fetchFromCoreData
{
    NSManagedObjectContext *moc = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"SuperHero" inManagedObjectContext:moc];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSFetchedResultsController *fetchedResultsController;
    NSError *error;
    NSSortDescriptor *sortDescriptor;
    NSArray *sortDescriptors;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    fetchRequest.entity = entityDescription;
    fetchRequest.sortDescriptors = sortDescriptors;
    fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil];
    [fetchedResultsController performFetch:&error];
    
    people = fetchedResultsController.fetchedObjects;
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
    
    SuperHero *hero = [people objectAtIndex:indexPath.row];
  
    NSURL *url = [NSURL URLWithString:hero.image];
    NSData *imageData  = [NSData dataWithContentsOfURL:url];
    
    tableViewCell.textLabel.text = hero.name;
    tableViewCell.detailTextLabel.text = hero.email;
    tableViewCell.imageView.image = [UIImage imageWithData:imageData];
    return tableViewCell;
}


@end
