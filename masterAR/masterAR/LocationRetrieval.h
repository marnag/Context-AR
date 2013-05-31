//
//  LocationRetrieval.h
//  masterAR
//
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationRetrieval : UIViewController<NSURLConnectionDelegate>{

    NSMutableData *_responseData;

}

@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *receivedData;

- (void)startFetchingData;

@end