//
//  MapOverlayView.m
//  masterAR
//
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import "MapOverlayView.h"

@interface MapOverlayView()

@property (nonatomic, strong) UIImage *overlayImage;

@end

@implementation MapOverlayView

- (instancetype)initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage *)overlayImage {
    self = [super initWithOverlay:overlay];
    if (self) {
        _overlayImage = overlayImage;
    }
    NSLog(@"Hit: initWIthOverlay");
    
    return self;
}

- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context {
    CGImageRef imageReference = self.overlayImage.CGImage;
    
    MKMapRect theMapRect = self.overlay.boundingMapRect;
    NSLog(@"Hit: drawMapRect");
    CGRect theRect = [self rectForMapRect:theMapRect];
    
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0.0, -theRect.size.height);
    CGContextDrawImage(context, theRect, imageReference);
}

@end
