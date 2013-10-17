#import "AppDelegate.h"
#import <CoreData/CoreData.h>



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    NSURL *sqliteURL = [[NSFileManager defaultManager] documentURLForFilename:@"Model.sqlite"];
    
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    if ([persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteURL options:nil error:nil]) {
        _moc = [[NSManagedObjectContext alloc] init];
        [_moc setPersistentStoreCoordinator:persistentStoreCoordinator];
    }

    return YES;
}

@end



@implementation UIApplication (mxcl)

+ (id)moc {
    return [(AppDelegate *)[UIApplication sharedApplication].delegate moc];
}

@end



@implementation NSFileManager (mxcl)

- (id)documentURLForFilename:(id)filename {
    NSURL *docsdir = [self URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    return [docsdir URLByAppendingPathComponent:filename];
}

@end
