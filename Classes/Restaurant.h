//
//  Restaurant.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Restaurant : Eatery {
	int restaurantId;
	NSString *name;
	NSString *coordinates;
	NSString *address;
	NSString *openingHours;
}

@property (nonatomic,assign) int restaurantId;
@property (nonatomic,assign) NSString *name;
@property (nonatomic,assign) NSString *coordinates;
@property (nonatomic,assign) NSString *address;
@property (nonatomic,assign) NSString *openingHours;

-(id)init;
-(id)initWithArguments:(int)eateryId 
		withEateryType:(NSString *)eateryType 
	  withRestaurantId:(NSString *)restaurantId 
			  withName:(NSString *)name 
	   withCoordinates:(NSString *)coordinates 
		   withAddress:(NSString *)address 
	  withOpeningHours:(NSString *)openingHours;

@end
