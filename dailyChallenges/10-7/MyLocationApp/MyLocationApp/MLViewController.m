//
//  MLViewController.m
//  MyLocationApp
//
//  Created by Matthew Loseke on 10/7/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

#define LAT_LONG_DELTA 0.02
#define MOBILE_MAKERS_LAT 41.893932
#define MOBILE_MAKERS_LONG -87.636650

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mapView.delegate = self;
    [self loadMobileMakersLocation];
}

- (void)loadMobileMakersLocation
{
    MKCoordinateSpan coordinateSpan = [self setSpanFromAppDefaults];
    CLLocationCoordinate2D center = [self setCenterFromLatitude:MOBILE_MAKERS_LAT andLongitude:MOBILE_MAKERS_LONG];
    MKCoordinateRegion coordinateRegion = [self setMKCoordinateRegionWithCenter:center andSpan:coordinateSpan];
    
    [mapView setRegion:coordinateRegion animated:YES];
}

- (MKCoordinateRegion)setMKCoordinateRegionWithCenter: (CLLocationCoordinate2D)center andSpan:(MKCoordinateSpan)span
{
    MKCoordinateRegion coordinateRegion;
    coordinateRegion.center = center;
    coordinateRegion.span = span;
    
    return coordinateRegion;
}

- (CLLocationCoordinate2D)setCenterFromLatitude: (double)latitude andLongitude:(double)longitude
{
    CLLocationCoordinate2D center;
    center.latitude = latitude;
    center.longitude = longitude;
    
    return center;
}

- (MKCoordinateSpan)setSpanFromAppDefaults
{
    MKCoordinateSpan coordinateSpan;
    coordinateSpan.latitudeDelta = LAT_LONG_DELTA;
    coordinateSpan.longitudeDelta = LAT_LONG_DELTA;
    
    return coordinateSpan;
}

@end
