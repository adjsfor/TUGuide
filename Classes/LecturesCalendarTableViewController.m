//
//  LecturesCalendarTableViewController.m
//  TUGuide
//
//  Created by Ivo Galic on 1/13/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "LecturesCalendarTableViewController.h"

@implementation LecturesCalendarTableViewController

@synthesize eventsList, eventStore, defaultCalendar, detailViewController, delegate2,classrooms;





#pragma mark -
#pragma mark Initilize

- (LecturesCalendarTableViewController *)initWithClassrooms:(NSMutableArray*)classes{
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.classrooms = classes;
	}
	return self;
}




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
	// Get the default calendar from store.
	self.defaultCalendar = [self.eventStore defaultCalendarForNewEvents];
	//	Create an Add button 
	UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
									  UIBarButtonSystemItemAdd target:self action:@selector(addEvent:)];
	self.navigationItem.rightBarButtonItem = addButtonItem;
	[addButtonItem release];
	//[self.eventsList addObjectsFromArray:[self fetchEventsForToday]];
	self.eventsList = [self fetchEventsForToday];
	self.navigationController.delegate = self;
	// Fetch today's event on selected calendar and put them into the eventsList array
	[self.tableView reloadData];
	
}


- (void)viewDidUnload {
	self.eventsList = nil;
}


- (void)viewWillAppear:(BOOL)animated {
	XLog("deselect");
	[self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:NO];	 
}


// Support all orientations except for Portrait Upside-down.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark -
#pragma mark Table view data source

// Fetching events happening in the next 15 days with a predicate, limiting to the default calendar 
- (NSMutableArray *)fetchEventsForToday {
	return [LecturesCalendarHelper getEKEventsFromCalendarWithPrefix:@"Tiss" startingDay:0 endingDay:15];
}


#pragma mark -
#pragma mark Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (tableView == self.tableView) return [[self.eventsList objectAtIndex:section] count];
	return 0;
}

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section{
	if (aTableView == self.tableView) 
	{
		if ([[self.eventsList objectAtIndex:section] count] == 0) return nil;
		EKEvent * event = [[self.eventsList objectAtIndex:section] objectAtIndex:0];
		NSDate * date = [event startDate];
		NSString * string = [LecturesCalendarHelper getFormatedDate:date];
		return [NSString stringWithFormat:@"%@", string];
	}
	else return nil;
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
	//cell.textLabel.text = [[self.eventsList objectAtIndex:indexPath.row] title];
	cell.textLabel.text = [[[self.eventsList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] title];
	
	return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {	
	// Upon selecting an event, create an EKEventViewController to display the event.
	self.detailViewController = [[LecturesDetailViewController alloc] initWithClassrooms:self.classrooms];			
	detailViewController.event = [[self.eventsList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	detailViewController.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];	
	// Allow event editing.
	detailViewController.allowsEditing = YES;
	
	//	Push detailViewController onto the navigation controller stack
	//	If the underlying event gets deleted, detailViewController will remove itself from
	//	the stack and clear its event property.
	

	//detailViewController.delegate = self;
	
	[delegate2 passTo:self command:@"editEvent" message:@"editingEvent"];
	//[self.navigationController pushViewController:detailViewController animated:YES];
	
}


#pragma mark -
#pragma mark Navigation Controller delegate

- (void)navigationController:(UINavigationController *)navigationController 
	  willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
	XLog("navigationController");
	// if we are navigating back to the rootViewController, and the detailViewController's event
	// has been deleted -  will title being NULL, then remove the events from the eventsList
	// and reload the table view. This takes care of reloading the table view after adding an event too.
	NSIndexPath *selectedIndexPath = [[self tableView] indexPathForSelectedRow];
	
	if (self.detailViewController.event.title == NULL) {
		[[self.eventsList objectAtIndex:selectedIndexPath.section] removeObject:self.detailViewController.event];		
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
	XLog();
	NSError *error = nil;
	EKEvent *thisEvent = controller.event;
	NSIndexPath *selectedIndexPath = [[self tableView] indexPathForSelectedRow];
	
	switch (action) {
		case EKEventEditViewActionCanceled:
			// Edit action canceled, do nothing. 
			break;
			
		case EKEventEditViewActionSaved:
			// When user hit "Done" button, save the newly created event to the event store, 
			// and reload table view.
			// If the new event is being added to the default calendar, then update its 
			// eventsList.
			if (self.defaultCalendar ==  thisEvent.calendar) 
				{
					[[self.eventsList objectAtIndex:selectedIndexPath.section] addObject:thisEvent];
					//[self.eventsList addObject:thisEvent];
				
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
				[[self.eventsList objectAtIndex:selectedIndexPath.section] addObject:thisEvent];
				//[self.eventsList removeObject:thisEvent];
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	 return [self.eventsList count];
}




@end