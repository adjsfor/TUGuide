//
//  tuAnnotation.m
//  mapAnnotations
//
//  Created by Martin Langeder on 03.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "TUAnnotation.h"

@implementation TUAnnotation 

@synthesize latitude, longitude, title, subtitle;


- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = [latitude doubleValue];
    theCoordinate.longitude = [longitude doubleValue];
    return theCoordinate; 
}

- (void)dealloc
{
    [super dealloc];
}

@end
