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
    
    self.mapView.delegate = self;
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    NSLog(@"mapViewDidFinishLoadingMap has fired");
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation has fired");
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 2800, 2800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}

@end
