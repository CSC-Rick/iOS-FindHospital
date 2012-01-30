//
//  Hospital.m
//  FindHospital
//
//  Created by rickx on 1/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Hospital.h"

@implementation Hospital

@synthesize name;
@synthesize description;
@synthesize position;
@synthesize image;

- (id)init
{
    if (self = [super init]) {
        self.position = [[Position alloc] init];
    }
    return self;
}

@end
