//
//  MapViewController.m
//  masterAR
//
//  Created by Martin Nagy on 12/15/12.
//  Copyright (c) 2012 Martin Nagy. All rights reserved.
//

#import "MapViewController.h"
#import "MapData.h"
#import "MapOverlay.h"
#import "MapOverlayView.h"
#define METERS_PER_MILE 1609.344

@interface MapViewController ()

@property (nonatomic, strong) MapData *park;

@end

@implementation MapViewController
@synthesize myMKMapView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:MapOverlay.class]) {
        UIImage *overlayImageFile = [UIImage imageNamed:@"overlay2"];
        MapOverlayView *overlayView = [[MapOverlayView alloc] initWithOverlay:overlay overlayImage:overlayImageFile];
        return overlayView;
    }
    return nil;
}

- (void)addOverlay {
    MapOverlay *overlay = [[MapOverlay alloc] initWithPark:self.park];
    [self.myMKMapView addOverlay:overlay];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	   
    self.park = [[MapData alloc] init];
    
    CLLocationDegrees latDelta = self.park.overlayTopLeftCoordinate.latitude - self.park.overlayBottomRightCoordinate.latitude;
    
    // think of a span as a tv size, measure from one corner to another
    MKCoordinateSpan span = MKCoordinateSpanMake(fabsf(latDelta), 0.0);
    MKCoordinateRegion region = MKCoordinateRegionMake(self.park.midCoordinate, span);
    
    self.myMKMapView.region = region;

    [myMKMapView setDelegate:self];
    
    [self.myMKMapView removeOverlays:self.myMKMapView.overlays];
    [self addOverlay];
    
    //[self addOverlay];
    
    /*    CLLocationCoordinate2D zoomLocation;
     zoomLocation.latitude = 69.653653;
     zoomLocation.longitude = 18.959366;
     
     MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
     
     [myMKMapView setRegion:viewRegion animated:YES];
     */

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
 
}

@end
