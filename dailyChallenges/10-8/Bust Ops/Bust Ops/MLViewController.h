//
//  MLViewController.h
//  Bust Ops
//
//  Created by Matthew Loseke on 10/8/13.
//  Copyright (c) 2013 Matthew Loseke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MLViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) NSArray *busStops;
@property (strong, nonatomic) IBOutlet UIView *routeDetailsView;
- (IBAction)changeIcons:(id)sender;

@end
