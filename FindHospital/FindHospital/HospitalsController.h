//
//  HospitalsController.h
//  FindHospital
//
//  Created by rickx on 1/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Position.h"
#import "HospitalInfo.h"

@interface HospitalsController : UITableViewController <CLLocationManagerDelegate>
{
    NSMutableArray *dataSource;
    Position *currentPosition;
    CLLocationManager *lm;
    HospitalInfo *hospitalInfo;
}
- (IBAction)RefreshTableView:(id)sender;

@end
