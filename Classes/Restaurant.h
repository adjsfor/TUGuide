//
//  Restaurant.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Eatery.h"


@interface Restaurant : Eatery {
	int restaurantId;
	NSString *name;
	NSString *coordinates;
	NSString *address;
	NSString *openingHours;
}

@property (nonatomic) int restaurantId;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *coordinates;
@property (nonatomic,retain) NSString *address;
@property (nonatomic,retain) NSString *openingHours;

-(id)init;
-(id)initWithArguments:(int)eateryId 
		withEateryType:(NSString *)eateryType 
	  withRestaurantId:(int)restaurantId 
			  withName:(NSString *)name 
	   withCoordinates:(NSString *)coordinates 
		   withAddress:(NSString *)address 
	  withOpeningHours:(NSString *)openingHours;

+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;
@end
