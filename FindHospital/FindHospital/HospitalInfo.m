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
//    NSString *soapMessage = [NSString stringWithFormat:
//                      @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"  
//                      "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"  
//                      "<soap:Body>\n"  
//                      "<GetTopTenHospitalInfo xmlns=\"http://tempuri.org/\">"  
//                      "[{\"manLongitude\":%f,\"manLatitude\":%f}]" 
//                      "</GetTopTenHospitalInfo>"   
//                      "</soap:Body>\n"  
//                      "</soap:Envelope>",position.longitude,position.latitude];
    NSString *soapMessage = [NSString stringWithFormat:
                             @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"  
                             "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"  
                             "<soap:Body>\n"  
                             "<GetTopTenHospitalInfo xmlns=\"http://tempuri.org/\">" 
                             "<manLongitude>%f</manLongitude>"
                             "<manLatitude>%f</manLatitude>"
                             "</GetTopTenHospitalInfo>"   
                             "</soap:Body>\n"  
                             "</soap:Envelope>",position.longitude,position.latitude];


    NSLog(soapMessage);
    
    NSURL *url = [NSURL URLWithString:@"http://tjv-nerd-iis7-2/Hospital/HospitalInfo.asmx"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];  
    [request addValue: @"http://tempuri.org/GetTopTenHospitalInfo" forHTTPHeaderField: @"SOAPAction"];  
    [request addValue: [NSString stringWithFormat:@"%d", soapMessage.length] forHTTPHeaderField:@"Content-Length"];  
    [request setHTTPMethod:@"POST"];  
    [request setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",response);
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data]; 
    parser.delegate = self;
    [parser parse];
    
    if (jsonString != nil && jsonString.length > 0) {
        NSMutableArray *hospitals = [NSMutableArray array];
        id jsonObject = [jsonString JSONValue];
        NSArray *objs = [jsonObject objectForKey:@"Hostpital"];
        for (id obj in objs) {
            NSLog([obj objectForKey:@"HospitalName"]);
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

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:jsonElementTitle]) {
        storingChars = YES;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (storingChars) {
        jsonString = string;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:jsonElementTitle]) {
        storingChars = NO;
    }
}

@end
