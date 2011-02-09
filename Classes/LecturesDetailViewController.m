//
//  LecturesDetailViewController.m
//  TUGuide
//
//  Created by Ivo Galic
//  Copyright Galic Design All rights reserved.
//

#import "LecturesDetailViewController.h"


@implementation LecturesDetailViewController
@synthesize delegate2,classrooms,classroom;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
//- (void)loadView {
//	detailView = [[LecturesDetailView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//	self.view = detailView;
//	
//	self.view.userInteractionEnabled = YES;
//}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (LecturesDetailViewController *)initWithClassrooms:(NSMutableArray*)classes{
	self = [super init];
	if (self) {
		self.classrooms = classes;
	}
	return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	//if (tableView == self.tableView) return [[self.eventsList objectAtIndex:section] count];
	return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if(indexPath.row < 2) {
	return	[super tableView:tableView cellForRowAtIndexPath:indexPath];
	}
	

	
	// Add my cell Location , Classroom PDF , I missed it?
	
	static NSString *CellIdentifier = @"Cell";
	
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
									   reuseIdentifier:CellIdentifier] autorelease];
	}

	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	// Get the event at the row selected and display it's title
	//cell.textLabel.text = [[self.eventsList objectAtIndex:indexPath.row] title];
	if(indexPath.row == 2){
		if (classroom == nil) {
			cell.textLabel.text = @"No classroom pdf";
			cell.detailTextLabel.text = @"No classroom available";
		}else {
			cell.textLabel.text = @"Display classroom location";
			cell.detailTextLabel.text = [classroom name];
		}		
	}

	
	return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
	XLog(" %i ", indexPath.row);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (classroom == nil) {
		return;
	}
    LocationDetailViewController *detailViewController = [[LocationDetailViewController alloc] initWithClassroom:self.classroom];
	detailViewController.title = classroom.name;
	// ...
	// Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];	
}




- (void)viewDidLoad{

	//self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];	
	//self.allowsEditing = YES;
	self.title = @"Lecture View";

	classroom = [LecturesCalendarHelper searchClassroomByName:self.classrooms name:[self.event location]];
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewWillDisappear:(BOOL)animated{
	[delegate2 passTo:self command:@"goDeselect" message:@"back"];
	[super viewWillDisappear:animated];
}

- (void)viewWillAppear:(BOOL)animated{
	XLog();
	if (classroom!=nil) {
		[[super tableView] deselectRowAtIndexPath:[[super tableView] indexPathForSelectedRow] animated:YES];
	
	}
	//[tableView deselectRowAtIndexPath:super.tableView.indexPathForSelectedRow animated:YES];
	[super viewWillAppear:animated];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
