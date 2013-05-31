//
//  MapOverlay.h
//  masterAR
//
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class MapData;

@interface MapOverlay : NSObject<MKOverlay>

- (instancetype)initWithPark:(MapData *)park;

@end
