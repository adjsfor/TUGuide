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
#import "UserLocationUpdate.h"
#import "MessagePassProtocol.h"


@interface FriendsViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate,MessagePassProtocol> {
	MKMapView *mapView;
	NSMutableArray *mapAnnotations;
	MapListClassViewController *classViewController;
	NSMutableArray *friendsArray;
	CLLocationManager *locationManager;
	UISegmentedControl *segmentedControl;
	UIButton *detailButton;
	CLLocationCoordinate2D location;
	User *me;
	FriendListViewController *flv;
}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) MapListClassViewController *classViewController;
@property (nonatomic, retain) NSMutableArray *friendsArray;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;
@property (nonatomic, retain) UIButton *detailButton;
@property (nonatomic, retain) User *me;
@property (nonatomic, retain) FriendListViewController *flv;

+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;

- (id)initView;
- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg; 
@end
