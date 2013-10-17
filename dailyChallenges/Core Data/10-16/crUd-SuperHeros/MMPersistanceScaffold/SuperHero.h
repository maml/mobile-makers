//
//  SuperHero.h
//  MMPersistanceScaffold
//
//  Created by Max Howell on 10/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SuperHero : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSString * image;

@end
