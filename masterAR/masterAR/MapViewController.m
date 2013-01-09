//
//  MapViewController.m
//  masterAR
//
//  Created by Martin Nagy on 12/15/12.
//  Copyright (c) 2012 Martin Nagy. All rights reserved.
//

#import "MapViewController.h"
#define METERS_PER_MILE 1609.344

@interface MapViewController ()

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {

    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 69.653653;
    zoomLocation.longitude = 18.959366;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    [myMKMapView setRegion:viewRegion animated:YES];

}


@end
