//
//  MapViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapListViewController.h"
#import "MapListDetailViewController.h"
#import "ServerGetData.h"
#import "DataPassProtocol.h"
#import "Classroom.h"
#import "Building.h"
#import <CoreLocation/CoreLocation.h>


@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>{
	
	MKMapView *mapView;
	NSMutableArray *mapAnnotations;
	MapListClassViewController *classViewController;
	NSMutableArray *buildingsArray;
	Classroom *classroom;
	Building *building;
	UISegmentedControl *segmentedControl;
	UIButton *detailButton;
	CLLocationCoordinate2D location;
	CLLocationManager *locationManager;

}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) MapListClassViewController *classViewController;
@property (nonatomic, retain) NSMutableArray *buildingsArray;
@property (nonatomic, retain) Classroom *classroom;
@property (nonatomic, retain) Building *building;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;
@property (nonatomic, retain) UIButton *detailButton;
@property (nonatomic, retain) CLLocationManager *locationManager;


+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;

- (id)initWithBuildings: (NSMutableArray *)b;
- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
-(void)locateUser:(id)sender;
- (void)gotoLocation;

@end
