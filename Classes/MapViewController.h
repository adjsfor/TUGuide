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

@interface MapViewController : UIViewController {
	MKMapView *mapView;
	IBOutlet UIImageView *shadowImage;

}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIImageView *shadowImage;

-(void)loadAnnotations;
-(void)gotoLocation;
@end
