//
//  LectureViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 14.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "LectureViewController.h"
#import "LecturesDetailController.h"
#import "LecturesDetailView.h"
#import <EventKit/EventKit.h>


@implementation LectureViewController
@synthesize lectures, detailViewController, eventStore, defaultCalendar;

#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.eventStore = [[EKEventStore alloc] init];
	
	self.lectures = [[NSMutableArray alloc] initWithArray:0];
	
	// Get the default calendar from store.
	self.defaultCalendar = [self.eventStore defaultCalendarForNewEvents];
	
	[self.lectures addObjectsFromArray:[self fetchEventsForWeek]];
	
	self.navigationController.delegate = self;
	[self.navigationController setNavigationBarHidden:NO];
	
	NSArray *segmentTextContent = [NSArray arrayWithObjects:@"Lectures", @"Courses", @"ToDo",nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextContent];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.frame = CGRectMake(0, 0, 300, 30);
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segmentedControl;
    [segmentedControl release];

}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[[self tableView] reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	[self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:NO];
}
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (NSArray *)fetchEventsForWeek {
	
	NSDate *startDate = [NSDate date];
	
	// endDate is 1 day = 60*60*24*7 seconds = 604800 seconds from startDate
	NSDate *endDate = [NSDate dateWithTimeIntervalSinceNow:604800];
	
	// Create the predicate. Pass it the default calendar.
	NSArray *calendarArray = [NSArray arrayWithObject:defaultCalendar];
	NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:startDate endDate:endDate 
																	calendars:calendarArray]; 
	
	// Fetch all events that match the predicate.
	NSArray *events = [self.eventStore eventsMatchingPredicate:predicate];
	
	return events;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 7;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	if ([lectures count] == 0) {
		return 1;
	}else {
		return [[self lectures] count];
	}
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    //  Configure the accessary to display on the right side of each cell;
	//  in this case a disclosure indicator to imply to the user that 
	//  touching a row will trigger navigation.
	//
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	
	//  Customize fonts
	
	UIFont *titleFont = [UIFont fontWithName:@"Helvetiva" size:18.0];
	[[cell textLabel] setFont:titleFont];
	
	UIFont *detailFont = [UIFont fontWithName:@"Georgia" size:16.0];
	[[cell detailTextLabel] setFont:detailFont];
	
	[cell autorelease];

	//NSString *dateString = [[[lectures objectAtIndex:indexPath.row] startDate]description];
	// this **dateString** string will have **"yyyy-MM-dd HH:mm:ss +0530"**
	//NSArray *arr = [dateString componentsSeparatedByString:@" "];
	// arr will have [0] -> yyyy-MM-dd, [1] -> HH:mm:ss, [2] -> +0530 (time zone)

	//NSString *title = [NSString stringWithFormat:@"%h %t", [arr objectAtIndex:2], [[lectures objectAtIndex:indexPath.row] title]];
	//cell.textLabel.text = title;
	cell.textLabel.text = @"Hallo ";

	//NSString *detailText = [[lectures objectAtIndex:indexPath.row] location];
	cell.detailTextLabel.text = @"welt ";

	return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    self.detailViewController = [[LecturesDetailController alloc] initWithNibName:nil bundle:nil];			
	//detailViewController.event = [self.lectures objectAtIndex:indexPath.row];
	//self.detailViewController.detailView.headerLabelNumber.text = [[self.lectures objectAtIndex:indexPath.row] title];
	self.detailViewController.detailView.headerLabelNumber.text = @"jslkjfl";
	//	Push detailViewController onto the navigation controller stack
	[self.navigationController pushViewController:detailViewController animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[eventStore release];
	[lectures release];
	[defaultCalendar release];
	[detailViewController release];
	
    [super dealloc];
}


@end

