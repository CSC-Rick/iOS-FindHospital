//
//  JsonRequest.h
//  FindHospital
//
//  Created by rickx on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Position.h"

@interface RequestFactory 

+ (NSMutableURLRequest *) jsonRequest:(Position *)position;

@end
