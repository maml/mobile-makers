#import <UIKit/UIKit.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectContext *moc;
@end



// convenience categories

@interface NSFileManager (mxcl)
- (NSURL *)documentURLForFilename:(id)filename;
@end

@interface UIApplication (mxcl)
+ (NSManagedObjectContext *)moc;
@end
