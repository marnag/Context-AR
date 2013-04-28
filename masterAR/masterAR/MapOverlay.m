//
//  MapOverlay.m
//  masterAR
//
//  Created by Martin Nagy on 4/28/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import "MapOverlay.h"
#import "MapData.h"

@implementation MapOverlay

@synthesize coordinate;
@synthesize boundingMapRect;

- (instancetype)initWithPark:(MapData *)park {
    self = [super init];
    if (self) {
        boundingMapRect = park.overlayBoundingMapRect;
        coordinate = park.midCoordinate;
    }
    
    return self;
}

@end
