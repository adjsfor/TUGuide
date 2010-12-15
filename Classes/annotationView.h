//
//  annotationView.h
//  mapAnnotations
//
//  Created by Martin Langeder on 03.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import "tuAnnotation.h"


@interface annotationView : MKAnnotationView 
{
	UIImageView *imageView;
}

@property (nonatomic, retain) UIImageView *imageView;

@end
