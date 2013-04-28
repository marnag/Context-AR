//
//  MapOverlay.m
//  masterAR
//
//  Created by Martin Nagy on 4/27/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import "MapData.h"

@implementation MapData

- (instancetype)init{
    self = [super init];
    
    _midCoordinate = CLLocationCoordinate2DMake(69.682877,18.973603);
    _overlayTopLeftCoordinate = CLLocationCoordinate2DMake(69.683409,18.972123);
    _overlayTopRightCoordinate = CLLocationCoordinate2DMake(69.683409,18.974665);
    _overlayBottomLeftCoordinate = CLLocationCoordinate2DMake(69.682437,18.972123);
    _overlayBottomRightCoordinate = CLLocationCoordinate2DMake(69.682437,18.974665);

    _boundaryPointsCount = 9;
    CLLocationCoordinate2D boundaryArray[] = {
        {34.4313,-118.59890},
        {34.4274,-118.60246},
        {34.4268,-118.60181},
        {34.4202,-118.6004},
        {34.42013,-118.59239},
        {34.42049,-118.59051},
        {34.42305,-118.59276},
        {34.42557,-118.59289},
        {34.42739,-118.59171}};
    
    _boundary = malloc(sizeof(CLLocationCoordinate2D)*_boundaryPointsCount);
    
    for(int i = 0; i < _boundaryPointsCount; i++) {
        _boundary[i] = boundaryArray[i];
    }
    
    return self;
}

- (MKMapRect)overlayBoundingMapRect {
    
    MKMapPoint topLeft = MKMapPointForCoordinate(_overlayTopLeftCoordinate);
    MKMapPoint topRight = MKMapPointForCoordinate(_overlayTopRightCoordinate);
    MKMapPoint bottomLeft = MKMapPointForCoordinate(_overlayBottomLeftCoordinate);
    
    return MKMapRectMake(topLeft.x,
                         topLeft.y,
                         fabs(topLeft.x - topRight.x),
                         fabs(topLeft.y - bottomLeft.y));
}

@end
