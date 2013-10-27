//
//  Contact.h
//   Core Data)
//
//  Created by Matthew Loseke on 10/17/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Address;

@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * number;
@property (nonatomic, retain) NSSet *addreses;
@end

@interface Contact (CoreDataGeneratedAccessors)

- (void)addAddresesObject:(Address *)value;
- (void)removeAddresesObject:(Address *)value;
- (void)addAddreses:(NSSet *)values;
- (void)removeAddreses:(NSSet *)values;

@end
