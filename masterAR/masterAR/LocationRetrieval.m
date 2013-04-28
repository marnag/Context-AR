//
//  LocationRetrieval.m
//  masterAR
//
//  Created by Martin Nagy on 4/28/13.
//  Copyright (c) 2013 Martin Nagy. All rights reserved.
//

#import "LocationRetrieval.h"

@implementation LocationRetrieval

@synthesize connection = _connection;
@synthesize receivedData = _receivedData;

#pragma mark NSURLConnection Delegate Methods

- (void)startFetchingData{
    
    //initialize new mutable data
    NSMutableData *data = [[NSMutableData alloc] init];
    self.receivedData = data;
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"https://app.campusguiden.no/position"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.connection = connection;
    
    //start the connection
    [connection start];
    
}

/*
 this method might be calling more than one times according to incoming data size
 */
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
}
/*
 if there is an error occured, this method will be called by connection
 */
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@" , error);
}

/*
 if data is successfully received, this method will be called by connection
 */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //initialize convert the received data to string with UTF8 encoding
    NSString *htmlSTR = [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding];
    NSLog(@"%@" , htmlSTR);

    NSError *err = nil;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:[htmlSTR dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&err];
    
    NSLog(@"My dictionary is %@", arr);
    
}

@end
