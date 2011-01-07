//
//  MapViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "tuAnnotation.h"
#import "annotationView.h"
#import "UIViewControllerDelegate.h"

@interface MapViewController : UIViewController <UINavigationBarDelegate, UINavigationControllerDelegate>{
	MKMapView *mapView;
	IBOutlet UIImageView *shadowImage;
	id <UIViewControllerDelegate>  delegate;

}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIImageView *shadowImage;
@property (assign) id <UIViewControllerDelegate> delegate;

-(void)loadAnnotations;
-(void)gotoLocation;
- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;

@end
