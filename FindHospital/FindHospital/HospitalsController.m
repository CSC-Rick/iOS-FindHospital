//
//  HospitalsController.m
//  FindHospital
//
//  Created by rickx on 1/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HospitalsController.h"
#import "Hospital.h"
#import "HospitalControllerSection.h"
#import "HospitalInfo.h"
#import "MapViewController.h"


@implementation HospitalsController 

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //init
    dataSource = [NSMutableArray array];
    currentPosition = [[Position alloc] init];
    hospitalInfo = [[HospitalInfo alloc] init];
    
    lm = [[CLLocationManager alloc] init];
    lm.desiredAccuracy = kCLLocationAccuracyBest;
    lm.distanceFilter = 100.0f;
    lm.delegate = self;
    [lm startUpdatingLocation];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [lm stopUpdatingLocation];
    dataSource = nil;
    currentPosition = nil;
    lm = nil;
    hospitalInfo = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"Current position";
    }
    else {
        return @"Search results";
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else {
        return dataSource.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalCellIdentifier"];
    if (indexPath.section == 0) {
        if (currentPosition != nil) {
            cell.textLabel.text = [NSString stringWithFormat:@"%.1f\u00B0 , %.1f\u00B0", currentPosition.longitude, currentPosition.latitude];
            //cell.accessoryType = UITableViewCellAccessoryNone;
            //cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //cell.userInteractionEnabled = NO;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    else {  
        Hospital *hospital = [dataSource objectAtIndex:indexPath.row];
        if (hospital != nil) {
            cell.textLabel.text = [NSString stringWithFormat:@"%@ %.1f\u00B0 , %.1f\u00B0", hospital.name, 
                                   hospital.position.longitude, hospital.position.latitude];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      
}

- (IBAction)RefreshTableView:(id)sender {
    [hospitalInfo GetHospitalsByPosition:currentPosition];
}

#pragma mark - Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    currentPosition.longitude = newLocation.coordinate.longitude;
    currentPosition.latitude = newLocation.coordinate.latitude;
    
    //search
    [dataSource removeAllObjects];
    [dataSource addObjectsFromArray:[hospitalInfo GetHospitalsByPosition:currentPosition]];
    
    [self.tableView reloadData];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MapViewController *mvController = segue.destinationViewController;
    mvController.currentPosition = currentPosition;
}

@end
