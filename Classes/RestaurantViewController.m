    //
//  RestaurantViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 08.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "RestaurantViewController.h"


@implementation RestaurantViewController

@synthesize mapView, segmentedController, restaurants, restaurant;

#pragma mark -

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}


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
			[self.navigationController popViewControllerAnimated:NO];
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


- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id)annotation
{
	static NSString* MensaAnnotationIdentifier = @"MensaAnnotationIdentifier";
	MKPinAnnotationView* pinView =
	(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:MensaAnnotationIdentifier];
	if (!pinView)
	{
		MKPinAnnotationView *annotationView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation
																		 reuseIdentifier:MensaAnnotationIdentifier] autorelease];
		annotationView.pinColor = MKPinAnnotationColorGreen;
		annotationView.animatesDrop = YES;
		annotationView.canShowCallout = YES;
		
		//UIImageView *tuAnnotationIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calloutTu.png"]];
		//annotationView.leftCalloutAccessoryView = tuAnnotationIcon;
		//[tuAnnotationIcon release];
		
		return annotationView;
	}
	return pinView;									
}

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
	mapView.delegate = self;
	mapView.mapType = MKMapTypeStandard;
	[self gotoLocation];
	[self.view addSubview:mapView];
	
	[self.mapView removeAnnotations:self.mapView.annotations];  // remove any annotations that exist
    [self.mapView addAnnotations:self.restaurants];   //set annotations to the map 
	
	//Change color of the navigationBar
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	// Create the segmented control. Choose one of the three styles
	NSArray *buttonNames = [NSArray arrayWithObjects:@"Mensa", @"Restaurant", nil];
	segmentedController = [[UISegmentedControl alloc] initWithItems:buttonNames];
	segmentedController.segmentedControlStyle = UIBarStyleBlackTranslucent; 
	segmentedController.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	segmentedController.frame = CGRectMake(0, 0, 290, 32);
	[segmentedController addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedController.selectedSegmentIndex = 1;
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedController;
	self.navigationItem.hidesBackButton = YES;
	
	[segmentedController release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views { 
	MKAnnotationView *aV; 
	for (aV in views) {
		CGRect endFrame = aV.frame;
		
		aV.frame = CGRectMake(aV.frame.origin.x, aV.frame.origin.y - 230.0, aV.frame.size.width, aV.frame.size.height);
		
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.45];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
		[aV setFrame:endFrame];
		[UIView commitAnimations];
		
	}
}

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
