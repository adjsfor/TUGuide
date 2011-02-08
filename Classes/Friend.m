//
//  Friend.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Friend.h"


@implementation Friend

@synthesize beFriendId;
@synthesize friendId;
@synthesize approved;
@synthesize coordinates_lat;
@synthesize coordinates_lon;
@synthesize title,subtitle;
@synthesize screen_name;
@synthesize last_login;
@synthesize email;



+ (id)customClassWithProperties:(NSDictionary *)properties {
	return [[[self alloc] initWithProperties:properties] autorelease];
}

- (id)initWithProperties:(NSDictionary *)properties {
	if (self = [self init]) {
		//[self setValuesForKeysWithDictionary:properties];
		self.coordinates_lat = [properties objectForKey:@"coordinates_lat"];
		self.coordinates_lon = [properties objectForKey:@"coordinates_lon"];
		self.screen_name = [properties objectForKey:@"screen_name"];
		self.last_login = [properties objectForKey:@"last_login"];
		self.title = [properties objectForKey:@"screen_name"];
		self.subtitle = [properties objectForKey:@"last_login"];
		self.email = [properties objectForKey:@"email"];
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
	[coordinates_lat release];
	[coordinates_lon release];
	[title,subtitle release];
	[screen_name release];
	[last_login release];
	[super dealloc];
}

@end
