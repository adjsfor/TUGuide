//
//  Mensa.h
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Eatery.h"

@interface Mensa : Eatery {
	int mensaId;
	NSString *name;
	NSString *coordinates;
	NSString *address;
	NSString *openingHours;
	NSArray *mensaMenu;
}

@property (nonatomic) int mensaId;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *coordinates;
@property (nonatomic,retain) NSString *address;
@property (nonatomic,retain) NSString *openingHours;
@property (nonatomic,retain) NSArray *mensaMenu;


-(id)initWithArguments:(int)eateryId 
		withEateryType:(NSString *)eateryType 
		   withMensaId:(int)mensaId 
			  withName:(NSString *)name 
	   withCoordinates:(NSString *)coordinates 
		   withAddress:(NSString *)address 
	  withOpeningHours:(NSString *)openingHours;

+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;


@end
