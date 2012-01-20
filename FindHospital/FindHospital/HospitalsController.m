//
//  HospitalsController.m
//  FindHospital
//
//  Created by rickx on 1/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HospitalsController.h"
#import "Hospital.h"


@implementation HospitalsController {
    NSArray *sectionTitles;
    NSMutableArray *hospitals;
    Position *currentPosition;
}

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
    sectionTitles = [NSArray arrayWithObjects:@"Currect position", @"Search results", nil];
    hospitals = [NSMutableArray array];
    Hospital *hospital = [[Hospital alloc] init];
    hospital.name = @"H1";
    hospital.description = @"sfsadfsdaf";
    hospital.position = [[Position alloc] init];
    hospital.position.longitude = 33.9;
    hospital.position.latitude = 65.2;
    [hospitals addObject:hospital];
    hospital = [[Hospital alloc] init];
    hospital.name = @"H2";
    hospital.description = @"sfsadfsdaf";
    hospital.position = [[Position alloc] init];
    hospital.position.longitude = 33.9;
    hospital.position.latitude = 65.2;
    [hospitals addObject:hospital];
    hospital = [[Hospital alloc] init];
    hospital.name = @"H3";
    hospital.description = @"sfsadfsdaf";
    hospital.position = [[Position alloc] init];
    hospital.position.longitude = 33.9;
    hospital.position.latitude = 65.2;
    [hospitals addObject:hospital];
    hospital = [[Hospital alloc] init];
    hospital.name = @"H4";
    hospital.description = @"sfsadfsdaf";
    hospital.position = [[Position alloc] init];
    hospital.position.longitude = 33.9;
    hospital.position.latitude = 65.2;
    [hospitals addObject:hospital];
    currentPosition = [[Position alloc] init];
    currentPosition.longitude = 76.3;
    currentPosition.latitude = -115.3;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    sectionTitles = nil;
    hospitals = nil;
    currentPosition = nil;
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
    return sectionTitles.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sectionTitles objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else
    {
        return hospitals.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HospitalCellIdentifier"];
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%.1f , %.1f", 
                               currentPosition.longitude, currentPosition.latitude];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.userInteractionEnabled = NO;
    }
    else {  
        Hospital *hospital = [hospitals objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %.1f , %.1f", hospital.name, 
                               hospital.position.longitude, hospital.position.latitude];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      
}

@end
