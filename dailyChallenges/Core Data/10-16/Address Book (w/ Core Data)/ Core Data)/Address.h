//
//  Address.h
//   Core Data)
//
//  Created by Matthew Loseke on 10/16/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contact;

@interface Address : NSManagedObject

@property (nonatomic, retain) NSString *freeform;
@property (nonatomic, retain) Contact *contact;

@end
