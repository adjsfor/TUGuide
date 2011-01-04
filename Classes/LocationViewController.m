    //
//  LocationViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 04.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "LocationViewController.h"


@implementation LocationViewController

@synthesize segmentedController, mapViewController, mapListViewController;

-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg{
	//NSLog(@"OrganizerNavigationController: switching to controller %@", cmd);
}



-(void) segmentAction: (UISegmentedControl *) sender
{
	
	switch (sender.selectedSegmentIndex) {
		case 0:
			XLog(@"Switch to map" );	
			self.view = mapViewController.view;
			break;
		case 1:
			XLog(@"Switch to list" );	
			self.view = mapListViewController.view;
			break;
		default:
			break;
	}
}

// this is C function for updating all subviews
NSArray *allSubviewsLocation(UIView *aView)
{
	NSArray *results = [aView subviews];
	for (UIView *eachView in [aView subviews])
	{
		NSArray *riz = allSubviewsLocation(eachView);
		if (riz) results = [results arrayByAddingObjectsFromArray:riz];
	}
	return results;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
	// create for segmented control
	mapViewController = [[MapViewController alloc] init];
	mapListViewController = [[MapListViewController alloc] init];
	
	self.view = mapViewController.view;
	
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	
	// Create the segmented control. Choose one of the three styles
	NSArray *buttonNames = [NSArray arrayWithObjects:@"Map", @"List", nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:buttonNames];
	segmentedControl.segmentedControlStyle = UIBarStyleBlackTranslucent; 
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	segmentedControl.frame = CGRectMake(0, 0, 290, 32);
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	
	// For menus, the momentary behavior is preferred. Otherwise, the segmented control
	// provides a radio-button style interface
	segmentedControl.momentary = NO;
	segmentedControl.selectedSegmentIndex = 0;
	
	CFShow(allSubviewsLocation(segmentedControl));
	
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedControl;
	[segmentedControl release];
	
	
}


- (id)init {
	
	if (self = [super initWithNibName:@"Location" bundle:nil]) {
		self.title = @"Location";
		UIImage* anImage = [UIImage imageNamed:@"1map.png"];
		UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Location" image:anImage tag:0];
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