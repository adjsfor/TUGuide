    //
//  RestaurantViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 08.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "RestaurantViewController.h"


@implementation RestaurantViewController

@synthesize mapView, segmentedController, restaurants;


-(id)initWithRestaurants: (NSMutableArray *) r
{
	restaurants = [[NSMutableArray alloc] init];
	restaurants = r;
	return self;
}

-(IBAction)segmentAction:(UISegmentedControl *)segmentPick
{
	NSLog(@"segment called %d", segmentPick.selectedSegmentIndex);
	switch (segmentPick.selectedSegmentIndex) {
		case 0:
			//pop this Controller from the Navigation Stack to go back to the rootViewController
			[self.navigationController popViewControllerAnimated:YES];
			break;
		case 1:
			//Do nothing because this is the right View and does not need to be changed
			break;
		default:
			break;
	}
}

-(void)gotoLocation
{
	MKCoordinateRegion newRegion;
    newRegion.center.latitude = 48.199047; //;
    newRegion.center.longitude = 16.36994;
    newRegion.span.latitudeDelta = 0.0112872;
    newRegion.span.longitudeDelta = 0.0109863;
	
    [self.mapView setRegion:newRegion animated:YES];
}
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {

}*/

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	//Creating Map View and Zoom into location
	mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	mapView.mapType = MKMapTypeStandard;
	[self gotoLocation];
	[self.view addSubview:mapView];
	
	//Change color of the navigationBar
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	// Create the segmented control. Choose one of the three styles
	NSArray *buttonNames = [NSArray arrayWithObjects:@"Mensa", @"Restaurant", nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:buttonNames];
	segmentedControl.segmentedControlStyle = UIBarStyleBlackTranslucent; 
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	segmentedControl.frame = CGRectMake(0, 0, 290, 32);
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.selectedSegmentIndex = 1;
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedControl;
	self.navigationItem.hidesBackButton = YES;
	[segmentedControl release];
}


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
