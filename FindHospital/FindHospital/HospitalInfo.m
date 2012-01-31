//
//  HospitalInfo.m
//  FindHospital
//
//  Created by rickx on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HospitalInfo.h"
#import <CoreLocation/CoreLocation.h>
#import "SBJson.h"
#import "Hospital.h"

@implementation HospitalInfo 

static NSString *jsonElementTitle = @"GetTopTenHospitalInfoResult";

- (NSArray *)GetHospitalsByPosition:(Position *)position
{
    NSString *soapMessage = [NSString stringWithFormat:
                      @"{manLongitude:%f,manLatitude:%f}",position.longitude,position.latitude];
    
    NSURL *url = [NSURL URLWithString:@"http://tjv-nerd-iis7-2/Hospital/HospitalInfo.asmx/GetTopTenHospitalInfo"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue: @"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];  
    [request addValue: [NSString stringWithFormat:@"%d", soapMessage.length] forHTTPHeaderField:@"Content-Length"];  
    [request setHTTPMethod:@"POST"];  
    [request setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    if (jsonString != nil && jsonString.length > 0) {
        NSMutableArray *hospitals = [NSMutableArray array];
        id jsonObject = [[[jsonString JSONValue] objectForKey:@"d"] JSONValue];
        NSArray *objs = [jsonObject objectForKey:@"Hostpital"];
        for (id obj in objs) {
            Hospital *hospital = [[Hospital alloc] init];
            hospital.name = [obj objectForKey:@"HospitalName"];
            hospital.position.longitude = [[obj objectForKey:@"HospitalLongitude"] floatValue];
            hospital.position.latitude = [[obj objectForKey:@"HospitalLatitude"] floatValue];
            [hospitals addObject:hospital];
        }
        return hospitals;
    }
    
    return nil;
}

@end
