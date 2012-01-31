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
#import "RequestFactory.h"
#import "Constants.h"

@implementation HospitalInfo 

- (NSArray *)GetHospitalsByPosition:(Position *)position
{
    NSMutableURLRequest *request = [RequestFactory jsonRequest:position];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    if (jsonString != nil && jsonString.length > 0) {
        NSMutableArray *hospitals = [NSMutableArray array];
        id jsonObject = [[[jsonString JSONValue] objectForKey:@"d"] JSONValue];
        NSArray *objs = [jsonObject objectForKey:HospitalKey];
        for (id obj in objs) {
            Hospital *hospital = [[Hospital alloc] init];
            hospital.name = [obj objectForKey:HospitalName];
            hospital.position.longitude = [[obj objectForKey:HospitalLongitude] floatValue];
            hospital.position.latitude = [[obj objectForKey:HospitalLatitude] floatValue];
            [hospitals addObject:hospital];
        }
        return hospitals;
    }
    
    return nil;
}

@end
