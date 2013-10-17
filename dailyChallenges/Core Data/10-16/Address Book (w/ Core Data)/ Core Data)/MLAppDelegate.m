//
//  MLAppDelegate.m
//   Core Data)
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLAppDelegate.h"

@implementation MLAppDelegate
{
    NSManagedObjectContext *moc;
}

- (NSManagedObjectContext *)managedObjectContext
{
    return moc;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setupCoreData];
    return YES;
}

- (void)setupCoreData
{
    NSManagedObjectModel *mom;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    
    NSURL *documentsDirectoryURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSURL *sqliteURL = [documentsDirectoryURL URLByAppendingPathComponent:@"Model.sqlite"];
    
    mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    if ([persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteURL options:nil error:nil])
    {
        moc = [[NSManagedObjectContext alloc] init];
        [moc setPersistentStoreCoordinator:persistentStoreCoordinator];
    }
}

@end
