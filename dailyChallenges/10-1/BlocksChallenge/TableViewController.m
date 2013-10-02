#import "TableViewController.h"
#import "MLViewController.h"

typedef void (^MLfilter)(void);

@implementation TableViewController

@synthesize filteredSetOfNumbers, originalSetOfNumbers;


- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self generateAndStoreRandomNumbers];
}

- (void)generateAndStoreRandomNumbers
{
    originalSetOfNumbers = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 50; i++) {
        
        int random = arc4random() % 501;
        [originalSetOfNumbers addObject: [NSNumber numberWithInteger: random]];
        NSLog(@"length? %i", originalSetOfNumbers.count);
        NSLog(@"random is %i", random);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [originalSetOfNumbers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    cell.textLabel.text = [[originalSetOfNumbers objectAtIndex:indexPath.row] description];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIBarButtonItem *)sender {
    
    MLViewController *vc = segue.destinationViewController;

    // instantiate the NSMutableArray's for filtered sets on this controller
    // and on the controller we're segueing into
    
    filteredSetOfNumbers = [[NSMutableArray alloc] init];
    vc.filteredNumbers = [[NSMutableArray alloc] init];

    
    /*
     on blocks . . .
     
     type (^block_name) (type_arguments) = ^ return_type (type arguments) {  //body and stuff  };

    */
    
    // void (^filterEven)(void)
    MLfilter filterEven = ^{
        for (int i = 0; i < originalSetOfNumbers.count; i++)
        {
            if ([originalSetOfNumbers[i] integerValue] % 2 == 0) {
                
                [filteredSetOfNumbers addObject:originalSetOfNumbers[i]];
                vc.filteredNumbers = filteredSetOfNumbers;
            }
        }
    };
    
    // void (^filterOdd)(void)
    MLfilter filterOdd = ^{
        for (int i = 0; i < originalSetOfNumbers.count; i++)
        {
            if ([originalSetOfNumbers[i] integerValue] % 2 != 0) {
                
                [filteredSetOfNumbers addObject:originalSetOfNumbers[i]];
                vc.filteredNumbers = filteredSetOfNumbers;
            }
        }
    };

    if (sender == _evenButton)
    {
        filterEven();
    }
    else
    {
        filterOdd();
    }
        
}

@end
