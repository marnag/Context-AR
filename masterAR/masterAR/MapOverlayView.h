//
//  MapOverlayView.h
//  masterAR
//
//  Created by Martin Nagy on 4/28/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapOverlayView : MKOverlayView

- (instancetype)initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage *)overlayImage;

@end
