//
//  SuperHero.h
//  MMPersistanceScaffold
//
//  Created by Matthew Loseke on 10/15/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SuperHero : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * image;

@end
