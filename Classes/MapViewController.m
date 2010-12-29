    //
//  MapViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController

@synthesize mapView;
@synthesize shadowImage;



- (id)init {
	
	if (self = [super init]) {
		self.title = @"Location/Map";
		UIImage* anImage = [UIImage imageNamed:@"1map.png"];
		UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Location" image:anImage tag:0];
		self.tabBarItem = theItem;
		[theItem release];
	}
	
	return self;
	
}



-(void) segmentAction: (UISegmentedControl *) sender
{
	
	XLog();
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	mapView.mapType = MKMapTypeStandard;
	[self loadAnnotations];
	[self gotoLocation];
	[self.view addSubview:mapView];
	
	
	
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
	
	//CFShow(allSubviews(segmentedControl));
	
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedControl;
	[segmentedControl release];
	
    [super viewDidLoad];
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

-(void)loadAnnotations
{
	CLLocationCoordinate2D workingCoordinate;
	
	workingCoordinate.latitude = 48.199047;
	workingCoordinate.longitude = 16.36994;
	tuAnnotation *tuMainBuilding = [[tuAnnotation alloc] initWithCoordinate:workingCoordinate];
	[tuMainBuilding setTitle:@"TU Hauptgebäude"];
	[tuMainBuilding setSubtitle:@"Karlsplatz 13"];
	[tuMainBuilding setAnnotationType:tuAnnotationTypeUni];
	
	[mapView addAnnotation:tuMainBuilding];
	
	workingCoordinate.latitude = 48.196471;
	workingCoordinate.longitude = 16.369522;
	tuAnnotation *tuNewEI = [[tuAnnotation alloc] initWithCoordinate:workingCoordinate];
	[tuNewEI setTitle:@"Neues EI"];
	[tuNewEI setSubtitle:@"Gußhausstraße 25-29"];
	[tuNewEI setAnnotationType:tuAnnotationTypeUni];
	
	[mapView addAnnotation:tuNewEI];
	
	workingCoordinate.latitude = 48.199013;
	workingCoordinate.longitude = 16.367403;
	tuAnnotation *freihaus = [[tuAnnotation alloc] initWithCoordinate:workingCoordinate];
	[freihaus setTitle:@"Freihaus"];
	[freihaus setSubtitle:@"Wiedner Hauptstraße 8-10"];
	[freihaus setAnnotationType:tuAnnotationTypeUni];
	
	[mapView addAnnotation:freihaus];
	
	workingCoordinate.latitude = 48.199074;
	workingCoordinate.longitude = 16.367322;
	tuAnnotation *mensa = [[tuAnnotation alloc] initWithCoordinate:workingCoordinate];
	[mensa setTitle:@"TU Mensa"];
	[mensa setSubtitle:@"Wiedner Hauptstraße 8-10"];
	[mensa setAnnotationType:tuAnnotationTypeMensa];
	
	[mapView addAnnotation:mensa];
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	
}

- (annotationView *)mapView:(MKMapView *)mappView viewForAnnotation:(id <MKAnnotation>)annotation
{
	annotationView *tuAnnotationView = nil;
	
	// determine the type of annotation, and produce the correct type of annotation view for it.
	tuAnnotation* myAnnotation = (tuAnnotation *)annotation;
	
	if(myAnnotation.annotationType == tuAnnotationTypeUni)
	{
		NSString* identifier = @"Uni";
		annotationView *newAnnotationView = (annotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[annotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		
		tuAnnotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == tuAnnotationTypeUni)
	{
		NSString* identifier = @"Mensa";
		
		annotationView *newAnnotationView = (annotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[annotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		
		tuAnnotationView = newAnnotationView;
	}
	
	[tuAnnotationView setEnabled:YES];
	[tuAnnotationView setCanShowCallout:YES];
	
	return tuAnnotationView;
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
