//
//  VisualizationData.h
//  masterAR
//
//  Created by Martin Nagy on 4/26/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlaceOfInterest.h"

@interface VisualizationData : NSObject{

    CLLocationCoordinate2D poiCoords0[4];

}

@property (nonatomic, strong) NSArray *placesOfInterest;

@end
