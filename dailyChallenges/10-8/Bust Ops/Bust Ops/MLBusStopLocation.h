//
//  MLBusStopLocation.h
//  Bust Ops
//
//  Created by Matthew Loseke on 10/8/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MLBusStopLocation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
