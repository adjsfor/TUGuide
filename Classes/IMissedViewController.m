//
//  IMissedViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 19.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "IMissedViewController.h"


@implementation IMissedViewController

@synthesize eventsList, eventStore, defaultCalendar;

#pragma mark -
#pragma mark Initialization

- (id)init {
	
	if (self = [super initWithNibName:nil bundle:nil]) {
		self = [super initWithStyle:UITableViewStyleGrouped];
		self.title = @"IMissedIt";
		UIImage* anImage = [UIImage imageNamed:@"iMisseditIcon.png"];
		UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"IMissedIt" image:anImage tag:0];
		self.tabBarItem = theItem;
		[theItem release];
	}
	
	return self;
	
}

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

    self.title = @"iMissedit";
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];

	// Initialize an event store object with the init method. Initilize the array for events.
	self.eventStore = [[EKEventStore alloc] init];
	
	// Get the default calendar from store.
	self.defaultCalendar = [self.eventStore defaultCalendarForNewEvents];
	
	//[self.eventsList addObjectsFromArray:[self fetchEventsForToday]];
	self.eventsList = [self fetchEventsForToday];
	//XLog(" %i ",[self.eventsList count]);
	
	self.navigationController.delegate = self;
	// Fetch today's event on selected calendar and put them into the eventsList array
	[self.tableView reloadData];
}


- (void)viewWillAppear:(BOOL)animated {
	XLog("deselect");
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
// Support all orientations except for Portrait Upside-down.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// Fetching events happening in the last 7 days with a predicate, limiting to the default calendar 
- (NSMutableArray *)fetchEventsForToday {
	return [LecturesCalendarHelper getEKEventsFromCalendarWithPrefix:@"Tiss" startingDay:-7 endingDay:0];
}


#pragma mark -
#pragma mark Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [self.eventsList count];
}

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
		NSString * string = [LecturesCalendarHelper getFormatedDate:date formatter:@"EEEE dd/MM/yyyy"];
		return [NSString stringWithFormat:@"%@", string];
	}
	else return nil;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"Cell";
	
	// Add disclosure triangle to cell hh:mma
	UITableViewCellAccessoryType editableCellAccessoryType =UITableViewCellAccessoryDisclosureIndicator;
	
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
									   reuseIdentifier:CellIdentifier] autorelease];
	}
	
	cell.accessoryType = editableCellAccessoryType;
	
	// Get the event at the row selected and display it's title
	//cell.textLabel.text = [[self.eventsList objectAtIndex:indexPath.row] title];
	EKEvent *e = [[self.eventsList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
	
	
	NSDate * dateStart = [e startDate];
	NSDate * dateEnd = [e endDate];
	NSString * date1 = [LecturesCalendarHelper getFormatedDate:dateStart formatter:@"hh:mm"];
	NSString * date2 = [LecturesCalendarHelper getFormatedDate:dateEnd formatter:@"hh:mm"];
	
	cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", date1, date2];
	cell.detailTextLabel.text = [e title];
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
    
    IMisseditDetailViewController *detailViewController = [[IMisseditDetailViewController alloc] init];
     // ...
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    self.eventsList = nil;
}


- (void)dealloc {
	[eventStore release];
	[eventsList release];
	[defaultCalendar release];
    [super dealloc];
}


@end

