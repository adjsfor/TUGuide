//
//  MapViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController

@synthesize mapView, detailButton;;
@synthesize mapAnnotations, classViewController, buildingsArray, classroom, building, segmentedControl;

#define BUILDINGS   0
#define MENSA		1
#define RESTAURANT  2
#define CLASSROOM   3

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}

- (id)initWithBuildings: (NSMutableArray *)b
{
	if (self) {
		self.title = @"Location";
		UIImage* anImage = [UIImage imageNamed:@"1map.png"];
		UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Location" image:anImage tag:0];
		self.tabBarItem = theItem;
		[theItem release];
		
		buildingsArray = [[NSMutableArray alloc] init];
		buildingsArray = b;
	}
	
	return self;
}

-(IBAction)segmentAction:(UISegmentedControl *)segmentPick
{
	NSLog(@"segment called %d", segmentPick.selectedSegmentIndex);
	switch (segmentPick.selectedSegmentIndex) {
		case 0:
			break;
		case 1:
			[self.navigationController pushViewController:[[MapListViewController alloc] initWithBuildings:buildingsArray] animated:NO];
			break;
		default:
			break;
	}
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	[super viewDidLoad];
	
	//Creating Map View and Zoom into location
	mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	mapView.mapType = MKMapTypeStandard;
	mapView.delegate = self;
	[self gotoLocation];
	[self.view addSubview:mapView];
	
	
	[self.mapView removeAnnotations:self.mapView.annotations];  // remove any annotations that exist
    [self.mapView addAnnotations:self.buildingsArray];   //set annotations to the map 
	
	//Change Color of the navigationBar
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	// Create the segmented control. Choose one of the three styles
	NSArray *segments = [NSArray arrayWithObjects:@"Map", @"List", nil];
	segmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
	segmentedControl.segmentedControlStyle = UIBarStyleBlackTranslucent; 
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	segmentedControl.frame = CGRectMake(0, 0, 290, 32);
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.selectedSegmentIndex = 0;
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedControl;
	self.navigationItem.hidesBackButton = YES;
	[segmentedControl release];
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

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	
}

- (void)showDetails:(UIButton *)sender
{
	NSInteger selectedIndex = sender.tag;
	building = [buildingsArray objectAtIndex:selectedIndex];
	
	classViewController = [[MapListClassViewController alloc] initWithBuilding:building];
	classViewController.title = building.name;
    [self.navigationController pushViewController:self.classViewController animated:YES];
	[classViewController release];
}


- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id)annotation
{
	static NSString* TuAnnotationIdentifier = @"TuAnnotationIdentifier";
	MKPinAnnotationView* pinView =
	(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:TuAnnotationIdentifier];
	if (!pinView)
	{
		MKAnnotationView *annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation
																		 reuseIdentifier:TuAnnotationIdentifier] autorelease];
		annotationView.canShowCallout = YES;
		
		UIImage *tuAnnotationImage = [UIImage imageNamed:@"tuAnnotation.png"];
		
		CGRect resizeRect;
		
		resizeRect.size = tuAnnotationImage.size;
		CGSize maxSize = CGRectInset(self.view.bounds,
									 [MapViewController annotationPadding],
									 [MapViewController annotationPadding]).size;
		maxSize.height -= self.navigationController.navigationBar.frame.size.height + [MapViewController calloutHeight];
		if (resizeRect.size.width > maxSize.width)
			resizeRect.size = CGSizeMake(maxSize.width, resizeRect.size.height / resizeRect.size.width * maxSize.width);
		if (resizeRect.size.height > maxSize.height)
			resizeRect.size = CGSizeMake(resizeRect.size.width / resizeRect.size.height * maxSize.height, maxSize.height);
		
		resizeRect.origin = (CGPoint){0.0f, 0.0f};
		UIGraphicsBeginImageContext(resizeRect.size);
		[tuAnnotationImage drawInRect:resizeRect];
		UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		annotationView.image = resizedImage;
		annotationView.opaque = NO;
		
		UIImageView *tuAnnotationIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"calloutTu.png"]];
		annotationView.leftCalloutAccessoryView = tuAnnotationIcon;
		[tuAnnotationIcon release];
		
		detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		[detailButton addTarget:self action:@selector(showDetails:) forControlEvents:UIControlEventTouchUpInside];
		
		//Value for tagging the buttons to acces the right detailView
		NSInteger tagValue = [buildingsArray indexOfObject:annotation];
		
		// set the tag property of the button to the index
		detailButton.tag = tagValue;
		NSLog(@"Dies ist der TagValue %i", tagValue);
		NSLog(@"Dies ist der buttonVa %i", detailButton.tag);
		detailButton.frame = CGRectMake(0, 0, 25, 25);
		
		// Set the button as the callout view
		annotationView.rightCalloutAccessoryView = detailButton; 
		
		return annotationView;
	}
	return pinView;									
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

-(void)viewDidAppear:(BOOL)animated{
	segmentedControl.selectedSegmentIndex = 0;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	self.mapAnnotations = nil;
    self.classViewController = nil;
    self.mapView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[mapView release];
    [classViewController release];
    [mapAnnotations release];
    [super dealloc];
}


@end
