//
//  MLBusStopLocation.m
//  Bust Ops
//
//  Created by Matthew Loseke on 10/8/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLBusStopLocation.h"

@interface MLBusStopLocation ()
{
    id observer;
}
@end

@implementation MLBusStopLocation

- (MLBusStopLocation *)init
{
    self = [super init];
    
    if (self) {
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        observer = [nc addObserverForName:@"change annotation view icons" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
            NSLog(@"the observer fired");
            // this is the mapView
            NSLog(@"mapView is %@", note.object);
            
            // seems like we should be able to notify the annotation view (MLAnnotationView) directly
            // TODO - test that out
            NSLog(@"view for its annotation is: %@", [note.object viewForAnnotation:self]);
        }];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

@end
