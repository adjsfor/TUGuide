//
//  RestaurantViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 08.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Restaurant.h"


@interface RestaurantViewController : UIViewController <MKMapViewDelegate> {

	UISegmentedControl *segmentedController;
	MKMapView *mapView;
	NSMutableArray *restaurants;
	Restaurant *restaurant;
}

@property (nonatomic, retain) UISegmentedControl *segmentedController;
@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *restaurants;
@property (nonatomic, retain) Restaurant *restaurant;

+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;

-(id)initWithRestaurants: (NSMutableArray *) r;
- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
- (void)gotoLocation;
@end