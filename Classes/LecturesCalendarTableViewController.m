//
//  LecturesCalendarTableViewController.m
//  TUGuide
//
//  Created by Ivo Galic on 1/13/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "LecturesCalendarTableViewController.h"

@implementation LecturesCalendarTableViewController

@synthesize eventsList, eventStore, defaultCalendar, detailViewController, delegate2;


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[eventStore release];
	[eventsList release];
	[defaultCalendar release];
	[detailViewController release];
	[super dealloc];
}


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	self.title = @"Events List";
	
	// Initialize an event store object with the init method. Initilize the array for events.
	self.eventStore = [[EKEventStore alloc] init];
	
	self.eventsList = [[NSMutableArray alloc] initWithArray:0];
	
	// Get the default calendar from store.
	self.defaultCalendar = [self.eventStore defaultCalendarForNewEvents];
	
	//	Create an Add button 
	UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
									  UIBarButtonSystemItemAdd target:self action:@selector(addEvent:)];
	self.navigationItem.rightBarButtonItem = addButtonItem;
	[addButtonItem release];
	
	
	self.navigationController.delegate = self;
	
	// Fetch today's event on selected calendar and put them into the eventsList array
	[self.eventsList addObjectsFromArray:[self fetchEventsForToday]];
	[self initTiss];
	[self.tableView reloadData];
	
}


- (void)viewDidUnload {
	self.eventsList = nil;
}


- (void)viewWillAppear:(BOOL)animated {
	[self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:NO];	 
}


// Support all orientations except for Portrait Upside-down.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark -
#pragma mark Table view data source

// Fetching events happening in the next 24 hours with a predicate, limiting to the default calendar 
- (NSArray *)fetchEventsForToday {
	
	//EKEventStore * eventStore = [[EKEventStore alloc] init];
	NSMutableArray * relevant_calendars =  [[NSMutableArray alloc]init];
	
	NSEnumerator *e = [[eventStore calendars] objectEnumerator];
	EKCalendar *object;
	while (object = (EKCalendar *)[e nextObject]) {
		XLog(@"ES GEHT %@",object.title);
		NSString *compare = object.title;
		if ([compare hasPrefix:@"Tiss"]) {
			XLog(@"->>>>>>>> %@",object.title);
			[relevant_calendars addObject:object];
		}
	}
	
	
	// Create the predicate's start and end dates.
	CFGregorianDate gregorianStartDate, gregorianEndDate;
	CFGregorianUnits startUnits = {0, 0, 0, 0, 0, 0};
	CFGregorianUnits endUnits = {0, 0, 14, 0, 0, 0};
	CFTimeZoneRef timeZone = CFTimeZoneCopySystem();
	
	gregorianStartDate = CFAbsoluteTimeGetGregorianDate(
														CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTimeGetCurrent(), timeZone, startUnits),
														timeZone);
	gregorianStartDate.hour = 0;
	gregorianStartDate.minute = 0;
	gregorianStartDate.second = 0;
	
	
	
	gregorianEndDate = CFAbsoluteTimeGetGregorianDate(
													  
													  CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTimeGetCurrent(), timeZone, endUnits),
													  timeZone);
	gregorianEndDate.hour = 0;
	gregorianEndDate.minute = 0;
	gregorianEndDate.second = 0;
	
	
	
	NSDate* startDate =   [NSDate dateWithTimeIntervalSinceReferenceDate:CFGregorianDateGetAbsoluteTime(gregorianStartDate, timeZone)];
	NSDate* endDate =   [NSDate dateWithTimeIntervalSinceReferenceDate:CFGregorianDateGetAbsoluteTime(gregorianEndDate, timeZone)];
	
	CFRelease(timeZone);
	
	// Create the predicate.
	
	NSPredicate *predicate = [eventStore predicateForEventsWithStartDate:startDate endDate:endDate calendars:relevant_calendars]; // eventStore is an instance variable.
	
	
	
	// Fetch all events that match the predicate.
	
	NSArray *events = [eventStore eventsMatchingPredicate:predicate];
	
	//[self setEvents:events];
	
	
	NSEnumerator *e1 = [events objectEnumerator];
	EKEvent *object1;
	while (object1 = (EKEvent *)[e1 nextObject]) {
		XLog(" ->>>>>>>  %@",object1.title);
	}
	
	return events;
}


#pragma mark -
#pragma mark Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return eventsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	// Add disclosure triangle to cell
	UITableViewCellAccessoryType editableCellAccessoryType =UITableViewCellAccessoryDisclosureIndicator;
	
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									   reuseIdentifier:CellIdentifier] autorelease];
	}
	
	cell.accessoryType = editableCellAccessoryType;
	
	// Get the event at the row selected and display it's title
	cell.textLabel.text = [[self.eventsList objectAtIndex:indexPath.row] title];
	
	return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	// Upon selecting an event, create an EKEventViewController to display the event.
	self.detailViewController = [[EKEventViewController alloc] initWithNibName:nil bundle:nil];			
	detailViewController.event = [self.eventsList objectAtIndex:indexPath.row];
	
	// Allow event editing.
	detailViewController.allowsEditing = YES;
	
	//	Push detailViewController onto the navigation controller stack
	//	If the underlying event gets deleted, detailViewController will remove itself from
	//	the stack and clear its event property.
	
	[delegate2 passTo:self command:@"editEvent" message:@"editingEvent"];
	//[self.navigationController pushViewController:detailViewController animated:YES];
	
}


#pragma mark -
#pragma mark Navigation Controller delegate

- (void)navigationController:(UINavigationController *)navigationController 
	  willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
	// if we are navigating back to the rootViewController, and the detailViewController's event
	// has been deleted -  will title being NULL, then remove the events from the eventsList
	// and reload the table view. This takes care of reloading the table view after adding an event too.
	if (viewController == self && self.detailViewController.event.title == NULL) {
		[self.eventsList removeObject:self.detailViewController.event];
		[self.tableView reloadData];
	}
}


#pragma mark -
#pragma mark Add a new event

// If event is nil, a new event is created and added to the specified event store. New events are 
// added to the default calendar. An exception is raised if set to an event that is not in the 
// specified event store.
- (void)addEvent:(id)sender {
	// When add button is pushed, create an EKEventEditViewController to display the event.
	EKEventEditViewController *addController = [[EKEventEditViewController alloc] initWithNibName:nil bundle:nil];
	
	// set the addController's event store to the current event store.
	addController.eventStore = self.eventStore;
	
	// present EventsAddViewController as a modal view controller
	[self presentModalViewController:addController animated:YES];
	
	addController.editViewDelegate = self;
	[addController release];
}


#pragma mark -
#pragma mark EKEventEditViewDelegate

// Overriding EKEventEditViewDelegate method to update event store according to user actions.
- (void)eventEditViewController:(EKEventEditViewController *)controller 
		  didCompleteWithAction:(EKEventEditViewAction)action {
	
	NSError *error = nil;
	EKEvent *thisEvent = controller.event;
	
	switch (action) {
		case EKEventEditViewActionCanceled:
			// Edit action canceled, do nothing. 
			break;
			
		case EKEventEditViewActionSaved:
			// When user hit "Done" button, save the newly created event to the event store, 
			// and reload table view.
			// If the new event is being added to the default calendar, then update its 
			// eventsList.
			if (self.defaultCalendar ==  thisEvent.calendar) {
				[self.eventsList addObject:thisEvent];
			}
			[controller.eventStore saveEvent:controller.event span:EKSpanThisEvent error:&error];
			[self.tableView reloadData];
			break;
			
		case EKEventEditViewActionDeleted:
			// When deleting an event, remove the event from the event store, 
			// and reload table view.
			// If deleting an event from the currenly default calendar, then update its 
			// eventsList.
			if (self.defaultCalendar ==  thisEvent.calendar) {
				[self.eventsList removeObject:thisEvent];
			}
			[controller.eventStore removeEvent:thisEvent span:EKSpanThisEvent error:&error];
			[self.tableView reloadData];
			break;
			
		default:
			break;
	}
	// Dismiss the modal view controller
	[controller dismissModalViewControllerAnimated:YES];
	
}


// Set the calendar edited by EKEventEditViewController to our chosen calendar - the default calendar.
- (EKCalendar *)eventEditViewControllerDefaultCalendarForNewEvents:(EKEventEditViewController *)controller {
	EKCalendar *calendarForEdit = self.defaultCalendar;
	return calendarForEdit;
}


- (void)initTiss{

	
	
}


@end