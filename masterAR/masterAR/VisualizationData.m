//
//  VisualizationData.m
//  masterAR
//
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import "VisualizationData.h"
#import "PlaceOfInterest.h"

@implementation VisualizationData

@synthesize placesOfInterest;

char *poiNames0[] = {
    "vegg1.png",
    "vegg2.png",
    "vegg3.png",
    "vegg4.png"
};

    CLLocationCoordinate2D poiCoords1[] = {
        {69.653856, 18.959567},
        {69.653781, 18.958633},
        {69.653515, 18.959146},
        {69.653588, 18.959945}};

int teller = 0;

int chosenVisualization = 0;


@end
