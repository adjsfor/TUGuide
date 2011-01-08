//
//  tuAnnotation.m
//  mapAnnotations
//
//  Created by Martin Langeder on 03.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "TUAnnotation.h"

@implementation TUAnnotation 

@synthesize image;
@synthesize latitude;
@synthesize longitude;


- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = 48.199047;
    theCoordinate.longitude = 16.36994;
    return theCoordinate; 
}

- (void)dealloc
{
    [image release];
    [super dealloc];
}

- (NSString *)title
{
    return @"San Francisco";
}

// optional
- (NSString *)subtitle
{
    return @"Founded: June 29, 1776";
}

@end
