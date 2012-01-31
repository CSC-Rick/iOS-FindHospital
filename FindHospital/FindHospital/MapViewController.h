//
//  MapViewController.h
//  FindHospital
//
//  Created by rickx on 1/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Position.h"

@interface MapViewController : UIViewController <UIWebViewDelegate>

@property (retain) Position *currentPosition;

@property (weak, nonatomic) IBOutlet UIWebView *mapView;
- (IBAction)back:(id)sender;

@end
