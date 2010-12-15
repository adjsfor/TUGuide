//
//  tuAnnotation.m
//  mapAnnotations
//
//  Created by Martin Langeder on 03.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "tuAnnotation.h"


@implementation tuAnnotation

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
@synthesize annotationType;

-init
{
	return self;
}

-initWithCoordinate:(CLLocationCoordinate2D)inCoord
{
	coordinate = inCoord;
	return self;
}


@end
