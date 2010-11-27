//
//  Building.m
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "Building.h"


@implementation Building

@synthesize buildingid;
@synthesize name;
@synthesize address;
@synthesize coordinates;


-(id)init{
	return [super init];
}

-(void)dealloc{
	[name release];
	[address release];
	[coordinates release];
	[super dealloc];
}

@end
