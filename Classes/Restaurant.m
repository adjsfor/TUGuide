//
//  Restaurant.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Restaurant.h"


@implementation Restaurant

@synthesize id;

@synthesize name;
@synthesize coordinates_lat;
@synthesize coordinates_lon;
@synthesize address;
@synthesize opening_hours_from_monday;
@synthesize opening_hours_until_monday;
@synthesize opening_hours_from_tuesday;
@synthesize opening_hours_until_tuesday;
@synthesize opening_hours_from_wednesday;
@synthesize opening_hours_until_wednesday;
@synthesize opening_hours_from_thursday;
@synthesize opening_hours_until_thursday;
@synthesize opening_hours_from_friday;
@synthesize opening_hours_until_friday;
@synthesize opening_hours_from_saturday;
@synthesize opening_hours_until_saturday;
@synthesize opening_hours_from_sunday;
@synthesize opening_hours_until_sunday;
@synthesize created;
@synthesize updated;
@synthesize title, subtitle;


+ (id)customClassWithProperties:(NSDictionary *)properties {
	return [[[self alloc] initWithProperties:properties] autorelease];
}

- (id)initWithProperties:(NSDictionary *)properties {
	if (self = [self init]) {
		//[self setValuesForKeysWithDictionary:properties];
		self.name = [properties objectForKey:@"name"];
		self.id = (int)[properties objectForKey:@"id"];
		self.coordinates_lat = [properties objectForKey:@"coordinates_lat"];
		self.coordinates_lon = [properties objectForKey:@"coordinates_lon"];
		self.address = [properties objectForKey:@"address"];
		self.title = self.name;
		self.subtitle = self.address;
		self.opening_hours_from_monday = [properties objectForKey:@"opening_hours_from_monday"];
		self.opening_hours_until_monday = [properties objectForKey:@"opening_hours_until_monday"];
		self.opening_hours_from_tuesday = [properties objectForKey:@"opening_hours_from_tuesday"];
		self.opening_hours_until_tuesday = [properties objectForKey:@"opening_hours_until_tuesday"];
		self.opening_hours_from_wednesday = [properties objectForKey:@"opening_hours_from_wednesday"];
		self.opening_hours_until_wednesday = [properties objectForKey:@"opening_hours_until_wednesday"];
		self.opening_hours_from_thursday = [properties objectForKey:@"opening_hours_from_thursday"];
		self.opening_hours_until_thursday = [properties objectForKey:@"opening_hours_until_thursday"];
		self.opening_hours_from_friday = [properties objectForKey:@"opening_hours_from_friday"];
		self.opening_hours_until_friday = [properties objectForKey:@"opening_hours_until_friday"];
		self.opening_hours_from_saturday = [properties objectForKey:@"opening_hours_from_saturday"];
		self.opening_hours_until_saturday = [properties objectForKey:@"opening_hours_until_saturday"];
		self.opening_hours_from_sunday = [properties objectForKey:@"opening_hours_from_sunday"];
		self.opening_hours_until_sunday = [properties objectForKey:@"opening_hours_until_sunday"];
		self.created = [properties objectForKey:@"created"];
		self.updated = [properties objectForKey:@"updated"];
	}
	return self;
}

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = [coordinates_lat doubleValue];
    theCoordinate.longitude = [coordinates_lon doubleValue];
    return theCoordinate; 
}

-(void)dealloc{
	[name release];
	[coordinates_lat release];
	[coordinates_lon release];
	[address release];
	[opening_hours_from_monday release];
	[opening_hours_until_monday release];
	[opening_hours_from_tuesday release];
	[opening_hours_until_tuesday release];
	[opening_hours_from_wednesday release];
	[opening_hours_until_wednesday release];
	[opening_hours_from_thursday release];
	[opening_hours_until_thursday release];
	[opening_hours_from_friday release];
	[opening_hours_until_friday release];
	[opening_hours_from_saturday release];
	[opening_hours_until_saturday release];
	[opening_hours_from_sunday release];
	[opening_hours_until_sunday release];
	[created release];
	[updated release];
	
	[super dealloc];
}

@end
