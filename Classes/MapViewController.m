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
@synthesize mapAnnotations, detailViewController, buildingsArray, getData, classroom, building;

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

- (id)init {
	
	if (self) {
		self.title = @"Location";
		UIImage* anImage = [UIImage imageNamed:@"1map.png"];
		UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Location" image:anImage tag:0];
		self.tabBarItem = theItem;
		[theItem release];
		[self getBuildings];
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
			[self.navigationController pushViewController:[[MapListViewController alloc] initWithBuildings:buildingsArray] animated:NO];
			break;
		default:
			break;
	}
}

-(void)passingCommand:(NSString *)cmd sender:(int)sd message:(NSString *)msg data:(NSString *)data{
	buildingsArray = [[NSMutableArray alloc]init];
	
	if ([cmd isEqual:@"dataRecieved"]) {
		//NEEDET VARIABLES
		NSData *plistData = [data dataUsingEncoding:NSUTF8StringEncoding];
		NSString *error;
		NSPropertyListFormat format;
		NSMutableArray* array;
		NSMutableDictionary* myDict;
		Classroom *c;
		Building *b;
		//END
		switch (sd) {
			case BUILDINGS:
				
				array = [NSPropertyListSerialization propertyListFromData:plistData
														 mutabilityOption:NSPropertyListImmutable
																   format:&format
														 errorDescription:&error];
				if (array) {
					myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
					NSLog(@"The count: %i", [myDict count]);
					for (NSDictionary* dict in array) {
						b = [Building customClassWithProperties:dict];
						[buildingsArray addObject:b];
						NSLog(@"----------------------------");
						NSLog(@"Building id: %@",b.id);
						NSLog(@"The name: %@", b.name);
						NSLog(@"%@", b.address);
						if (b.classroomsList != nil) {
							for (Classroom* class in b.classroomsList){
								NSLog(@"Classroom name: %@", class.name);
							}
						}
						NSLog(@"----------------------------");
						
						//[b release];
					}
				} else {
					NSLog(@"Plist does not exist, error:%@",error);
				}
				break;
			case RESTAURANT:
				
				break;
			case MENSA:
				
				break;
			case CLASSROOM:
				array = [NSPropertyListSerialization propertyListFromData:plistData
														 mutabilityOption:NSPropertyListImmutable
																   format:&format
														 errorDescription:&error];
				if (array) {
					myDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
					NSLog(@"The count: %i", [myDict count]);
					for (NSDictionary* dict in array) {
						c = [Classroom customClassWithProperties:dict];
						NSLog(@"----------------------------");
						NSLog(@"Classroom id: %@",c.id);
						NSLog(@"The name: %@", c.name);
						NSLog(@"The building_ID: %@", c.building_id);
						//NSLog(@"The building: %@", c.building.name);
						NSLog(@"----------------------------");
						//[c dealloc];
					}
				} else {
					NSLog(@"Plist does not exist, error:%@",error);
				}
				break;
			default:
				break;
		}
		//[myDict release];
		//[plistData release];
		//[error release];
		//[array release];
	}
	if ([cmd isEqual:@"dataRecievedFailed"]) {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Server offline" message:msg delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
	}
	if ([cmd isEqual:@"serverOffline"]) {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Server offline" message:msg delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
	}
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	[super viewDidLoad];
	
	//Creating Map View and Zoom into location
	mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
	mapView.mapType = MKMapTypeStandard;
	[self gotoLocation];
	[self.view addSubview:mapView];
	
	//[self getBuildings];
	mapAnnotations = [self createAnnotations:buildingsArray];
	//Creating annotations and applying them to the map
	[self.mapView removeAnnotations:self.mapView.annotations];  // remove any annotations that exist
    [self.mapView addAnnotations:self.mapAnnotations];    
	
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

-(void)getBuildings
{
	getData = [[ServerGetData alloc]initWithURL];
	getData.delegate2 = self;
	buildingsArray = [[NSMutableArray alloc] init];
	[getData getAllBuildings];
}

-(NSMutableArray *)createAnnotations:(NSMutableArray *)buildings
{
	self.mapAnnotations = [[NSMutableArray alloc] init];
	//TUAnnotation *tuAnnotation = [[TUAnnotation alloc] init];
    for (Building *b in buildings) {
		TUAnnotation *tuAnnotation = [[TUAnnotation alloc] init];
		tuAnnotation.title = b.name;
		tuAnnotation.subtitle = b.address;
		tuAnnotation.latitude = b.coordinates_lat;
		tuAnnotation.longitude = b.coordinates_lon;
		[mapAnnotations addObject:tuAnnotation];
		[tuAnnotation release];
	}
	return mapAnnotations;
	
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
	
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
	
}

- (void)showDetails:(id)sender
{
	detailViewController = [[MapListDetailViewController alloc] init];
    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // if it's the user location, just return nil.
        static NSString* TUAnnotationIdentifier = @"TUAnnotationIdentifier";
        MKPinAnnotationView* pinView =
		(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:TUAnnotationIdentifier];
        if (!pinView)
        {
            // if an existing pin view was not available, create one
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:TUAnnotationIdentifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorPurple;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
			
			
			UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
			
            return customPinView;
			
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
            
            customPinView.image = resizedImage;
            customPinView.opaque = NO;
			
            UIImageView *sfIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1map.png"]];
            customPinView.leftCalloutAccessoryView = sfIconView;
            [sfIconView release];
            
            return customPinView;
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
