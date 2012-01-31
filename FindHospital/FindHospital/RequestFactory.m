//
//  JsonRequest.m
//  FindHospital
//
//  Created by rickx on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RequestFactory.h"
#import "Constants.h"

@implementation RequestFactory

+ (NSMutableURLRequest *)jsonRequest:(Position *)position
{
    NSString *jsonMessage = [NSString stringWithFormat: JsonQueryString, position.longitude,position.latitude];
    NSURL *url = [NSURL URLWithString:ServerUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue: JsonContentType forHTTPHeaderField:@"Content-Type"];  
    [request addValue: [NSString stringWithFormat:@"%d", jsonMessage.length] forHTTPHeaderField:@"Content-Length"];  
    [request setHTTPMethod:@"POST"];  
    [request setHTTPBody: [jsonMessage dataUsingEncoding:NSUTF8StringEncoding]];
    return request;
}

@end
