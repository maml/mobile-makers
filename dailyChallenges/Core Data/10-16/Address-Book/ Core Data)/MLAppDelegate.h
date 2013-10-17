//
//  MLAppDelegate.h
//   Core Data)
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (NSManagedObjectContext *)managedObjectContext;

@end
