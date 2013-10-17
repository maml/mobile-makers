//
//  AppDelegate.m
//  MMPersistanceScaffold
//
//  Created by Don Bora on 6/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@implementation AppDelegate
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