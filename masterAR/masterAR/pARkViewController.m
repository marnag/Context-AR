/*
     File: pARkViewController.m
 Abstract: Simple view controller for the pARk example. Provides a hard-coded list of places-of-interest to its associated ARView when loaded, starts the ARView when it appears, and stops it when it disappears.
  Version: 1.0
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2012 Apple Inc. All Rights Reserved.
 
 */

#import "pARkViewController.h"
#import "PlaceOfInterest.h"
#import "ARView.h"
#import "FilterViewController.h"

#import <CoreLocation/CoreLocation.h>

@implementation pARkViewController

char *poiNames[] = {
    "viz1.png",
    "viz2.png",
    "viz3.png",
    "viz4.png"
};

CLLocationCoordinate2D poiCoords[] = {
    {69.653856, 18.959567},
    {69.653781, 18.958633},
    {69.653515, 18.959146},
    {69.653588, 18.959945}};

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	ARView *arView = (ARView *)self.view;
	
	// Create array of hard-coded places-of-interest, in this case some famous parks
 
    NSMutableArray *placesOfInterest = [self setPOI];
    
	[arView setPlacesOfInterest:placesOfInterest];	
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshView:) name:@"refreshView" object:nil];
     NSLog(@"Sett ARview");
    
}

- (NSMutableArray *)setPOI
{

    int numPois = sizeof(poiCoords) / sizeof(CLLocationCoordinate2D);
    
    NSMutableArray *placesOfInterest = [NSMutableArray arrayWithCapacity:numPois];
	for (int i = 0; i < numPois; i++) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithCString:poiNames[i] encoding:NSASCIIStringEncoding]]];
        PlaceOfInterest *poi = [PlaceOfInterest placeOfInterestWithView:image at:[[CLLocation alloc] initWithLatitude:poiCoords[i].latitude longitude:poiCoords[i].longitude]];
		[placesOfInterest insertObject:poi atIndex:i];
	}

    return placesOfInterest;
    
}

- (char)convertVizData:(int *) chosenViz{

    return nil;
}

- (void)refreshView:(NSNotification *) notification{

    vizData = [[VisualizationData alloc] init];
    
    FilterViewController *mpObject = (FilterViewController *) [notification object];
    int current = mpObject.currentItem;
    NSString *chosenViz = [NSString stringWithFormat:@"%d", current];
    char *vizFileChar = [[NSString stringWithFormat:@"%@%@%@", @"viz", chosenViz, @".png"] UTF8String];
    
    poiNames[0] = vizFileChar;
    poiNames[1] = vizFileChar;
    poiNames[2] = vizFileChar;
    poiNames[3] = vizFileChar;    
    
    [self viewDidDisappear:YES];
    [self viewWillAppear:YES];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	ARView *arView = (ARView *)self.view;

    NSMutableArray *placesOfInterest = [self setPOI];
	[arView setPlacesOfInterest:placesOfInterest];
	
    [arView start];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	ARView *arView = (ARView *)self.view;
	[arView stop];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationPortrait;
}

@end
