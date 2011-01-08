//
//  RestaurantViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 08.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface RestaurantViewController : UIViewController {

	UISegmentedControl *segmentedController;
	MKMapView *mapView;
	
}

@property (nonatomic, retain) UISegmentedControl *segmentedController;
@property (nonatomic, retain) MKMapView *mapView;


- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
- (void)gotoLocation;
@end