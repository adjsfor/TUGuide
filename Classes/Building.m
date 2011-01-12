//
//  Building.m
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "Building.h"


@implementation Building

@synthesize id;
@synthesize name, title, subtitle;
@synthesize address;

@synthesize coordinates_lat;
@synthesize coordinates_lon;
@synthesize link;

@synthesize created;
@synthesize updated;
@synthesize classroomsList;

-(id)init{
	return [super init];
}

+ (id)customClassWithProperties:(NSDictionary *)properties {
	return [[[self alloc] initWithProperties:properties] autorelease];
}

- (id)initWithProperties:(NSDictionary *)properties {
	if (self = [self init]) {
		//[self setValuesForKeysWithDictionary:properties];
		self.id = (int)[properties objectForKey:@"id"];
		self.name = [properties objectForKey:@"name"];
		self.address =[properties objectForKey:@"address"];
		self.title = self.name;
		self.subtitle = self.address;
		self.coordinates_lat = [properties objectForKey:@"coordinates_lat"];
		self.coordinates_lon = [properties objectForKey:@"coordinates_lon"];
		self.link = [properties objectForKey:@"link"];
		self.created = [properties objectForKey:@"created"];
		self.updated = [properties objectForKey:@"updated"];
		
		if ([properties objectForKey:@"Classrooms"] != nil) {
			if ([[properties objectForKey:@"Classrooms"] count] >0) {
				classroomsList = [[NSMutableArray alloc] init];
				for (NSDictionary* dict in [properties objectForKey:@"Classrooms"]) {
					[classroomsList addObject:[Classroom customClassWithProperties:dict]];
				}
			}
		}
	}
	return self;
}

- (CLLocationCoordinate2D)coordinate;
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = [coordinates_lat doubleValue];
    theCoordinate.longitude = [coordinates_lon doubleValue];
    return theCoordinate; 
}

-(void)dealloc{
	[name release];
	[address release];
	[link release];
	[created release];
	[updated release];
	[classroomsList release];
	[super dealloc];
}

@end
