//
//  MLViewController.m
//  hackwich
//
//  Created by Matthew Loseke on 10/8/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#define MOBILE_MAKERS_LAT 41.893932
#define MOBILE_MAKERS_LONG -87.636650

#import "MLViewController.h"
#import "MLAcademyLocation.h"
#import "MLAnnotationView.h"

@interface MLViewController ()

@end

@implementation MLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)viewDidAppear:(BOOL)animated
{
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(MOBILE_MAKERS_LAT, MOBILE_MAKERS_LONG);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.02, 0.02);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    [self.mapView setRegion:region animated:YES];
    
    MLAcademyLocation *location = [[MLAcademyLocation alloc] init];
    location.title = @"Mobile Makers";
    location.coordinate = center;
    [self.mapView addAnnotation:location];
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
    // assign the view's annotation to annotation
    // then grab the coordinate of that annotation and assign it to coordinate
    // then create an instance of MKPlacemark and init with coordinate
    // then create an instance of MKMapItem and init with the MKPlacemark you just created, call it mapitem
    // set name on mapitem to annotation's title
    // finally call openInMapsWithLaunchOptions on mapitem, pass dictionary key for directions-to-mapitem-from-current-user-location
    
    id <MKAnnotation> annotation = view.annotation;
    CLLocationCoordinate2D coordinate = [annotation coordinate];
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    MKMapItem *mapitem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapitem.name = annotation.title;
    [mapitem openInMapsWithLaunchOptions:@{MKLaunchOptionsDirectionsModeKey :MKLaunchOptionsDirectionsModeWalking}];
}

@end
