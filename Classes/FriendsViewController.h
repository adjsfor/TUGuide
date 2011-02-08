//
//  FriendsViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 1/7/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "FriendListViewController.h"
#import "MapListDetailViewController.h"
#import "ServerGetData.h"
#import "DataPassProtocol.h"
#import "Classroom.h"
#import "Friend.h"
#import <CoreLocation/CoreLocation.h>

@interface FriendsViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate> {
	MKMapView *mapView;
	NSMutableArray *mapAnnotations;
	MapListClassViewController *classViewController;
	NSMutableArray *friendsArray;
	Classroom *classroom;
	Building *building;
	UISegmentedControl *segmentedControl;
	UIButton *detailButton;
	CLLocationCoordinate2D location;
	User *me;
}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) MapListClassViewController *classViewController;
@property (nonatomic, retain) NSMutableArray *friendsArray;
@property (nonatomic, retain) Classroom *classroom;
@property (nonatomic, retain) Building *building;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;
@property (nonatomic, retain) UIButton *detailButton;
@property (nonatomic, retain) User *me;


+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;

- (id)initView;
- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;

@end
