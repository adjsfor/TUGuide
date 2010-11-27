//
//  Mensa.m
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "Mensa.h"


@implementation Mensa

@synthesize mensaId;
@synthesize name;
@synthesize coordinates;
@synthesize address;
@synthesize openingHours;

-(id)init{
	return [super self];
}

-(id)initWithArguments:(int)eateryId;



-(void)dealloc{
	[name release];
	[coordinates release];
	[address release];
	[openingHours release];
	[super dealloc];
}


@end
