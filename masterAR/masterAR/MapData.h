//
//  MapOverlay.h
//  masterAR
//
//  Created by Martin Nagy on 4/27/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapData : NSObject


@property (nonatomic, readonly) CLLocationCoordinate2D *boundary;

@property (nonatomic, readonly) NSInteger boundaryPointsCount;

@property (nonatomic, readonly) CLLocationCoordinate2D midCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayTopLeftCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayTopRightCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayBottomLeftCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D overlayBottomRightCoordinate;

@property (nonatomic, readonly) MKMapRect overlayBoundingMapRect;


@end
