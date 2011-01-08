//
//  Restaurant.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Restaurant.h"


@implementation Restaurant

@synthesize restaurantId;
@synthesize name;
@synthesize coordinates;
@synthesize address;
@synthesize openingHours;

-(id)initWithArguments:(int)eateryId2 
		withEateryType:(NSString *)eateryType2 
	  withRestaurantId:(int)restaurantId2 
			  withName:(NSString *)name2 
	   withCoordinates:(NSString *)coordinates2 
		   withAddress:(NSString *)address2 
	  withOpeningHours:(NSString *)openingHours2{
	
	if (self = [super init]) {
		self.eateryId = eateryId2;
		self.eateryType = eateryType2;
		self.restaurantId = restaurantId2;
		self.name = name2;
		self.coordinates = coordinates2;
		self.address = address2;
		self.openingHours = openingHours2;
	}
	return self;
}

-(id)init{
	return [self initWithArguments:0 withEateryType:nil withRestaurantId:0 withName:nil withCoordinates:nil withAddress:nil withOpeningHours:nil];
}

+ (id)customClassWithProperties:(NSDictionary *)properties {
	return [[[self alloc] initWithProperties:properties] autorelease];
}

- (id)initWithProperties:(NSDictionary *)properties {
	if (self = [self init]) {
		[self setValuesForKeysWithDictionary:properties];
	}
	return self;
}

-(void)dealloc{
	[eateryType release];
	[name release];
	[coordinates release];
	[address release];
	[openingHours release];
	[super dealloc];
}

@end
