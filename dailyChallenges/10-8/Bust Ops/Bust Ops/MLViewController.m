//
//  MLViewController.m
//  Bust Ops
//
//  Created by Matthew Loseke on 10/8/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import "MLViewController.h"
#import "MLBusStopLocation.h"
#import "MLAnnotationView.h"

@interface MLViewController ()

@end

@implementation MLViewController

@synthesize routeDetailsView, busStops;

- (void)viewDidAppear:(BOOL)animated
{
    [self getBustopdata];
    [self setMapRegion];
}

// set up a viewing region of the map that includes all the annotations
- (void)setMapRegion
{
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(41.845, -87.68);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.4, 0.29);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    [self.mapView setRegion:region animated:YES];
}

// gets the bus stop data, puts the array of dictionaries (bus stops) into a class
// property, busStops, and then calls the method to annotate the map
- (void)getBustopdata
{
    NSURL *url = [NSURL URLWithString:@"http://mobilemakers.co/lib/bus.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *myData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&connectionError];
        self.busStops = myData[@"row"];
        [self annotateMapWithBusStops];
    }];
}

// iterates through each stop and creates an instance of MLBusStopLocation and adds
// it to the map
- (void)annotateMapWithBusStops
{
    for (NSDictionary *stop in self.busStops) {
        MLBusStopLocation *location = [[MLBusStopLocation alloc] init];
        location.title = stop[@"cta_stop_name"];
        location.subtitle = stop[@"routes"];
        location.coordinate = CLLocationCoordinate2DMake([stop[@"latitude"] floatValue], [stop[@"longitude"] floatValue]);
        [self.mapView addAnnotation:location];
    }
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
 
    NSString *reuseID = @"abc";
    
    MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:reuseID];
    
    if (!view) {
        view = [[MLAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseID];
        view.canShowCallout = YES;
        view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    } else {
        view.annotation = annotation;
    }
    
    return view;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [self toggleRouteDetailsView];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    [routeDetailsView setAlpha:0];
}

- (void)toggleRouteDetailsView
{
    if (routeDetailsView.alpha) {
        [UIView animateWithDuration:0.4f animations:^{
            [routeDetailsView setAlpha:0];
        }];
    } else {
        [UIView animateWithDuration:0.4f animations:^{
            [routeDetailsView setAlpha:1.0];
        }];
    }
}



@end






