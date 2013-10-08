//
//  MLViewController.m
//  Geolocation
//
//  Created by Matthew Loseke on 10/7/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"

@interface MLViewController ()
{
    CLLocationManager *locationManager;
}
@end

@implementation MLViewController

@synthesize myMapView, locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    //myMapView = [[MKMapView alloc] init];
    //myMapView.delegate = self;
    
    //CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(41.89, -87.63);
    //[myMapView setCenterCoordinate:coord animated:YES];
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"Location changed [%i] %@", locations.count, [locations objectAtIndex:0]);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

- (IBAction)makeItHappen:(id)sender {
    
    [locationManager startUpdatingLocation];
    
}

@end
