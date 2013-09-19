//
//  MLStartup.h
//  Startup
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLEmployee.h"
#import "MLManager.h"

@interface MLStartup : NSObject

@property (weak, nonatomic) NSString *name;
@property (weak, nonatomic) MLManager *boss;
@property (weak, nonatomic) MLEmployee *coder;
@property (weak, nonatomic) MLEmployee *projectManager;
@property (weak, nonatomic) MLEmployee *designer;

@end
