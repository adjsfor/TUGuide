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
@synthesize mensaMenu;

-(id)init{
	return [super self];
}

-(id)initWithArguments:(int)eateryId2 
		withEateryType:(NSString *)eateryType2 
		   withMensaId:(int)mensaId2
			  withName:(NSString *)name2 
	   withCoordinates:(NSString *)coordinates2 
		   withAddress:(NSString *)address2 
	  withOpeningHours:(NSString *)openingHours2{
	
	self = [self init];
	super.eateryId = eateryId2;
	super.eateryType = eateryType2;
	self.mensaId = mensaId2;
	self.name = name2;
	self.coordinates = coordinates2;
	self.address = address2;
	self.openingHours = openingHours2;
	return self;
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
	[mensaMenu release];
	[name release];
	[coordinates release];
	[address release];
	[openingHours release];
	[super dealloc];
}


@end
