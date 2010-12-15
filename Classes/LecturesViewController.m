//
//  LecturesViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 14.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "LecturesViewController.h"

@implementation LecturesViewController

@synthesize lectures, eventStore, defaultCalendar, detailViewController, segmentedControl, delegate;

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
	
	// Initialize an event store object with the init method. Initilize the array for events.
	self.eventStore = [[EKEventStore alloc] init];
	
	self.lectures = [[NSMutableArray alloc] initWithArray:0];
	
	// Get the default calendar from store.
	self.defaultCalendar = [self.eventStore defaultCalendarForNewEvents];
	
	self.navigationController.delegate = self;
	
	// Fetch today's event on selected calendar and put them into the eventsList array
	[self.lectures addObjectsFromArray:[self fetchEventsForWeek]];
	
	[self.tableView reloadData];
	
	NSArray *segmentTextContent = [NSArray arrayWithObjects:@"Lectures", @"Courses", @"ToDo",nil];
	segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextContent];
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    segmentedControl.frame = CGRectMake(0, 0, 300, 30);
    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = segmentedControl;
    [segmentedControl release];
}

-(IBAction)segmentAction:(UISegmentedControl *)segmentPick
{
	NSLog(@"segment called %d", segmentPick.selectedSegmentIndex);
	switch (segmentPick.selectedSegmentIndex) {
		case 0:
			[delegate passTo:self command:@"Lectures" message:@"Switch to Lectures"];
			break;
		case 1:
			[delegate passTo:self command:@"Courses" message:@"Switch to Courses"];
			break;
		case 2:
			[delegate passTo:self command:@"ToDo" message:@"Switch to ToDo"];
			break;
		default:
			break;
	}
}


- (void)viewWillAppear:(BOOL)animated {
	[self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:NO];
}


/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
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

#pragma mark -
#pragma mark Table view data source

// Fetching events happening in the next Week with a predicate, limiting to the default calendar 
- (NSArray *)fetchEventsForWeek {
	
	NSDate *startDate = [NSDate date];
	
	// endDate is 1 Week = 60*60*24*7 seconds = 604800 seconds from startDate
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
#pragma mark Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 7;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
	return 5;
	//return lectures.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	//  See the Simple TableView example for an explanation of dequeuing and
    //  reuse identifiers.
    //
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"MyCell"];
        
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
    }
    
	//cell.textLabel.text = [[self.eventsList objectAtIndex:indexPath.row] title];
	
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
	
	detailViewController = [[LecturesDetailViewController alloc] init];			
	
	//detailViewController.event = [self.lectures objectAtIndex:indexPath.row];
	//self.detailViewController.detailView.headerLabelNumber.text = [[self.lectures objectAtIndex:indexPath.row] title];
	//[self.detailViewController.detailView.headerLabelNumber setText:@"jflaökfjslk"];// = @"jslkjfl";
	
	
	[[(LecturesDetailView *)[detailViewController view] headerLabelCourseName] setText:@"LecturesDetailView"];
	//detailViewController.detailView.headerLabelCourseName.text = @"LecturesViewController";
	
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
	
    [super dealloc];
}


@end

