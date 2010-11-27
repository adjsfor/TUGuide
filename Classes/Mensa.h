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
@property (nonatomic,assign) NSString *name;
@property (nonatomic,assign) NSString *coordinates;
@property (nonatomic,assign) NSString *address;
@property (nonatomic,assign) NSString *openingHours;
@property (nonatomic,assign) NSArray *mensaMenu;


-(id)initWithArguments:(int)eateryId 
		withEateryType:(NSString *)eateryType 
		   withMensaId:(int)mensaId 
			  withName:(NSString *)name 
	   withCoordinates:(NSString *)coordinates 
		   withAddress:(NSString *)address 
	  withOpeningHours:(NSString *)openingHours;


@end
