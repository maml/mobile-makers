#import "ViewController.h"
#import "AppDelegate.h"
#import "SuperHero.h"
#import "EditViewController.h"

@implementation ViewController {
    __weak IBOutlet UITableView *oTableView;
    NSArray *people;
    NSFetchedResultsController *fetcher;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"hasData"]) {
        [self fetchFromNetworkWithCompletion:^{
            // completion block because we check for the NSUserDefault here
            // so we SHOULD set it here too. Keep related code together.

            [[UIApplication moc] save:nil];
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasData"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [self fetchFromCoreData];
            [oTableView reloadData];
        }];
    } else {
        [self fetchFromCoreData];
    }
}

- (void)fetchFromNetworkWithCompletion:(void(^)(void))completionBlock
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    id rq = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mobilemakers.co/lib/superheroes.json"]];
    
    [NSURLConnection sendAsynchronousRequest:rq queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse* response, NSData* data, NSError* error)
    {
        NSArray *JSON = (NSArray*)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
         
        for (NSDictionary *dictionary in JSON) {
            NSURL *src = [NSURL URLWithString:dictionary[@"avatar_url"]];
            NSURL *dst = [[NSFileManager defaultManager] documentURLForFilename:src.lastPathComponent];
            [[NSData dataWithContentsOfURL:src] writeToURL:dst atomically:YES];

            SuperHero *hero = [NSEntityDescription insertNewObjectForEntityForName:@"SuperHero" inManagedObjectContext:[UIApplication moc]];
            hero.name = [dictionary objectForKey:@"name"];
            hero.bio = [dictionary objectForKey:@"description"];
            hero.image = dst.absoluteString;
        }
        
        completionBlock();
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
     }];
}

- (void)fetchFromCoreData
{
    NSFetchRequest *rq = [NSFetchRequest fetchRequestWithEntityName:@"SuperHero"];
    rq.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES]];

    fetcher = [[NSFetchedResultsController alloc] initWithFetchRequest:rq
                                                  managedObjectContext:[UIApplication moc]
                                                    sectionNameKeyPath:nil
                                                             cacheName:nil];
    [fetcher performFetch:nil];
    fetcher.delegate = self;
}

-(void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath
{
    [oTableView reloadData];
}

#pragma mark UITableViewDataSouce

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return fetcher.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SuperHero *hero = fetcher.fetchedObjects[indexPath.row];

    UITableViewCell* cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Superhero" forIndexPath:indexPath];
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.bio;
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:hero.image]]];
    return cell;
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender
{
    EditViewController *editViewController = segue.destinationViewController;
    NSIndexPath *indexPath = [oTableView indexPathForCell:sender];
    int row = indexPath.row;
    editViewController.hero = [fetcher.fetchedObjects objectAtIndex:row];
}
 */

@end
