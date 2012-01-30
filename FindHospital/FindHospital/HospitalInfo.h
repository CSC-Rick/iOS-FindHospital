//
//  HospitalInfo.h
//  FindHospital
//
//  Created by rickx on 1/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Position.h"
#import <CoreLocation/CoreLocation.h>

@interface HospitalInfo : NSObject <NSXMLParserDelegate>
{
    BOOL storingChars;
    NSString *jsonString;
}

- (NSArray *)GetHospitalsByPosition:(Position *)position;

@end
