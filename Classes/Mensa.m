//
//  Mensa.m
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "Mensa.h"


@implementation Mensa

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

@synthesize mensaMenus;

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

		if ([properties objectForKey:@"MensaMenus"] != nil) {
			if ([[properties objectForKey:@"MensaMenus"] count] >0) {
				mensaMenus = [[NSMutableArray alloc] init];
				for (NSDictionary* dict in [properties objectForKey:@"MensaMenus"]) {
					[mensaMenus addObject:[MensaMenu customClassWithProperties:dict]];
				}
			}
		}
	}
	return self;
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
	
	[mensaMenus release];

	[super dealloc];
}


@end
