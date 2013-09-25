//
//  MLAppDelegate.m
//  ToDoList
//
//  Created by Matthew Loseke on 9/24/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLAppDelegate.h"

@implementation MLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIViewController *vc = self.window.rootViewController;
    self.uinc = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = self.uinc;
    return YES;
}
							
@end
