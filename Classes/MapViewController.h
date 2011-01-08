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

@interface MapViewController : UIViewController <UINavigationBarDelegate, UINavigationControllerDelegate>{
	MKMapView *mapView;
	IBOutlet UIImageView *tuImage;
	NSMutableArray *mapAnnotations;
	MapListDetailViewController *detailViewController;
}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIImageView *tuImage;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) MapListDetailViewController *detailViewController;

+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;

- (void)gotoLocation;
- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;

@end
