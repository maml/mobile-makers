//
//  MLViewController.m
//  Startup
//
//  Created by Matthew Loseke on 9/19/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLStartup.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MLStartup *startup = [[MLStartup alloc] init];
    [startup setName:@"Startup"];

    MLManager *manager1 = [[MLManager alloc] init];
    [manager1 setName:@"George"];
    [manager1 setEmail:@"george@startup.com"];
    [manager1 setAge:55];
    [manager1 setType:@"Boss"];
    [manager1 setNumberOfDirectReports:1];
    MLManager *manager2 = [[MLManager alloc] init];
    [manager2 setName:@"Linda"];
    [manager2 setEmail:@"linda@startup.com"];
    [manager2 setAge:37];
    [manager2 setType:@"Project Manager"];
    [manager2 setNumberOfDirectReports:2];
    MLEmployee *employee1 = [[MLEmployee alloc] init];
    [employee1 setName:@"Howie"];
    [employee1 setEmail:@"howie@startup.com"];
    [employee1 setType:@"Coder"];
    [employee1 setAge:25];
    MLEmployee *employee2 = [[MLEmployee alloc] init];
    [employee2 setName:@"Katie"];
    [employee2 setEmail:@"katie@email.com"];
    [employee2 setAge:20];
    [employee2 setType:@"Designer"];
    
    [startup setBoss:manager1];
    [startup setProjectManager:manager2];
    [startup setCoder:employee1];
    [startup setDesigner:employee2];
    
    NSLog(@"\n--%@\n----%@ - %d\n------%@ - %d\n------%@ - %d\n------%@ - %d\n", [startup name], [[startup boss] type], [[startup boss] age], [[startup projectManager] type], [[startup projectManager] age], [[startup coder] type], [[startup coder] age], [[startup designer] type], [[startup designer] age]);

    // Copying via a class method approach
    NSLog(@"\n\nLet's copy a person . . .\n");
    NSLog(@"original person's name is %@", [employee2 name]);
    MLPerson *copiedPerson = [MLPerson copy:employee2];
    NSLog(@"copied person's name is  .. . %@", copiedPerson.name);

    // initWithPerson demo . ..
    NSLog(@"Let's use initWithPerons!!!\n");
    NSLog(@"We'll be passing %@ to our initWithPerson method", [employee1 name]);

    MLPerson *newPerson = [MLPerson initWithPerson:employee1];
    NSLog(@"We just initialized %@, a brand new person!", [newPerson name]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
