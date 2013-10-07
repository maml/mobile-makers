//
//  MLViewController.h
//  MyLocationApp
//
//  Created by Matthew Loseke on 10/7/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MLViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property BOOL didLoadMobileMakersLocation;

@end
