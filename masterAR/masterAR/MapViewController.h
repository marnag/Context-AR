//
//  MapViewController.h
//  masterAR
//
//  Copyright (c) 2012 Martin Nagy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *myMKMapView;

@end
