//
//  MLViewController.m
//  MyLocationApp
//
//  Created by Matthew Loseke on 10/7/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

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
    MKCoordinateRegion coordinateRegion;
    MKCoordinateSpan coordinateSpan;
    CLLocationCoordinate2D locationCoordinate2D;
    
    locationCoordinate2D.latitude = 41.893932;
    locationCoordinate2D.longitude = -87.636650;
    
    coordinateSpan.latitudeDelta = 0.02;
    coordinateSpan.longitudeDelta = 0.02;
    
    coordinateRegion.center = locationCoordinate2D;
    coordinateRegion.span = coordinateSpan;
    
    [mapView setRegion:coordinateRegion animated:YES];
}

@end
