//
//  Hospital.h
//  FindHospital
//
//  Created by rickx on 1/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Position.h"

@interface Hospital : NSObject

@property (copy) NSString *name;
@property (copy) NSString *description;
@property (retain) Position *position;
@property (retain) UIImage *image;

@end
