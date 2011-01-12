//
//  MapViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "TUAnnotation.h"
#import "MapListViewController.h"
#import "MapListDetailViewController.h"
#import "ServerGetData.h"
#import "DataPassProtocol.h"
#import "Classroom.h"
#import "Building.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>{
	MKMapView *mapView;
	IBOutlet UIImageView *tuImage;
	NSMutableArray *mapAnnotations;
	MapListDetailViewController *detailViewController;
	NSMutableArray *buildingsArray;
	Classroom *classroom;
	Building *building;
	UISegmentedControl *segmentedControl;

}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) MapListDetailViewController *detailViewController;
@property (nonatomic, retain) NSMutableArray *buildingsArray;
@property (nonatomic, retain) Classroom *classroom;
@property (nonatomic, retain) Building *building;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;


+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;

- (id)initWithBuildings: (NSMutableArray *)b;
- (void)gotoLocation;
- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
-(NSMutableArray *)createAnnotations:(NSMutableArray *)buildings;

@end
