    //
//  OrganizerViewController.m
//  TUGuide
//
//  Created by Ivo Galic on 12/28/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "OrganizerViewController.h"


@implementation OrganizerViewController

@synthesize segmentedController, lecturesViewController, coursesViewController, todoViewController;

-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg{
	//NSLog(@"OrganizerNavigationController: switching to controller %@", cmd);
}



-(void) segmentAction: (UISegmentedControl *) sender
{
	
	switch (sender.selectedSegmentIndex) {
		case 0:
			XLog(@"Switch to lectures" );	
			self.view = lecturesViewController.view;
			break;
		case 1:
			XLog(@"Switch to courses" );	
			self.view = coursesViewController.view;
			break;
		case 2:
			XLog(@"Switch to todo's" );
			self.view = todoViewController.view;
			break;
		default:
			break;
	}
}

// this is C function for updating all subviews
NSArray *allSubviews(UIView *aView)
{
	NSArray *results = [aView subviews];
	for (UIView *eachView in [aView subviews])
	{
		NSArray *riz = allSubviews(eachView);
		if (riz) results = [results arrayByAddingObjectsFromArray:riz];
	}
	return results;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
	// create for segmented control
	lecturesViewController = [[LecturesViewController alloc] init];
	coursesViewController = [[CoursesViewController alloc] init];
	todoViewController = [[ToDoViewController alloc] init];
	
	self.view = lecturesViewController.view;
	
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	
	// Create the segmented control. Choose one of the three styles
	NSArray *buttonNames = [NSArray arrayWithObjects:@"Lectures", @"Courses", @"Todo", nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:buttonNames];
	segmentedControl.segmentedControlStyle = UIBarStyleBlackTranslucent; 
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	segmentedControl.frame = CGRectMake(0, 0, 290, 32);
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	
	// For menus, the momentary behavior is preferred. Otherwise, the segmented control
	// provides a radio-button style interface
	segmentedControl.momentary = NO;
	segmentedControl.selectedSegmentIndex = 0;
	
	CFShow(allSubviews(segmentedControl));
	
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedControl;
	[segmentedControl release];
	
	
}


- (id)init {
	
	if (self = [super initWithNibName:@"Organizer" bundle:nil]) {
		self.title = @"Organizer";
		UIImage* anImage = [UIImage imageNamed:@"40-inbox.png"];
		UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Organizer" image:anImage tag:0];
		self.tabBarItem = theItem;
		[theItem release];
	}
	
	return self;
	
}


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

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
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
