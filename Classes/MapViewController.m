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
@synthesize tuImage, mapAnnotations, detailViewController;

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}

- (id)init {
	
	if (self) {
		self.title = @"Location";
		UIImage* anImage = [UIImage imageNamed:@"1map.png"];
		UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Location" image:anImage tag:0];
		self.tabBarItem = theItem;
		[theItem release];
	}
	
	return self;
	
}


-(IBAction)segmentAction:(UISegmentedControl *)segmentPick
{
	NSLog(@"segment called %d", segmentPick.selectedSegmentIndex);
	switch (segmentPick.selectedSegmentIndex) {
		case 0:
			//[delegate passTo:self command:@"Map" message:@"Switch to Map"];
			break;
		case 1:
			[self.navigationController pushViewController:[[MapListViewController alloc] init] animated:NO];
			break;
		default:
			break;
	}
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	//Creating Map View and Zoom into location
	mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	mapView.mapType = MKMapTypeStandard;
	[self gotoLocation];
	[self.view addSubview:mapView];
	
	//Creating annotations and applying them to the map
	self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:2];
	TUAnnotation *tuAnnotation = [[TUAnnotation alloc] init];
    [self.mapAnnotations insertObject:tuAnnotation atIndex:0];
	[self.mapView removeAnnotations:self.mapView.annotations];  // remove any annotations that exist
    [self.mapView addAnnotations:self.mapAnnotations];    [tuAnnotation release];
	
	//Change Color of the navigationBar
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	// Create the segmented control. Choose one of the three styles
	NSArray *segments = [NSArray arrayWithObjects:@"Map", @"List", nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
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

- (void)showDetails:(id)sender
{
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // handle our two custom annotations
    //
    if ([annotation isKindOfClass:[TUAnnotation class]]) 
	{
        static NSString* TUAnnotationIdentifier = @"TUAnnotationIdentifier";
        MKPinAnnotationView* pinView =
		(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:TUAnnotationIdentifier];
        if (!pinView)
        {
            MKAnnotationView *annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                             reuseIdentifier:TUAnnotationIdentifier] autorelease];
            annotationView.canShowCallout = YES;
			
            UIImage *flagImage = [UIImage imageNamed:@"flag.png"];
            
            CGRect resizeRect;
            
            resizeRect.size = flagImage.size;
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
            [flagImage drawInRect:resizeRect];
            UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            annotationView.image = resizedImage;
            annotationView.opaque = NO;
			
            UIImageView *sfIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1map.png"]];
            annotationView.leftCalloutAccessoryView = sfIconView;
            [sfIconView release];
            
            return annotationView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    
    return nil;
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
	self.mapAnnotations = nil;
    self.detailViewController = nil;
    self.mapView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[mapView release];
    [detailViewController release];
    [mapAnnotations release];
    [super dealloc];
}


@end
