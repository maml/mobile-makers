//
//  MLViewController.h
//  Geolocation
//
//  Created by Matthew Loseke on 10/7/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MLViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>

- (IBAction)makeItHappen:(id)sender;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;

@end
