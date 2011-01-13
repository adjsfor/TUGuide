//
//  Restaurant.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Eatery.h"
#import <MapKit/MapKit.h>



@interface Restaurant : Eatery <MKAnnotation>{
	int id;
	
	NSString *name;
	NSString *coordinates_lat;
	NSString *coordinates_lon;
	NSString *address;
	NSString *opening_hours_from_monday;
	NSString *opening_hours_until_monday;
	NSString *opening_hours_from_tuesday;
	NSString *opening_hours_until_tuesday;
	NSString *opening_hours_from_wednesday;
	NSString *opening_hours_until_wednesday;
	NSString *opening_hours_from_thursday;
	NSString *opening_hours_until_thursday;
	NSString *opening_hours_from_friday;
	NSString *opening_hours_until_friday;
	NSString *opening_hours_from_saturday;
	NSString *opening_hours_until_saturday;
	NSString *opening_hours_from_sunday;
	NSString *opening_hours_until_sunday;
	NSString *created;
	NSString *updated;
	NSString *title;
	NSString *subtitle;
}

@property (nonatomic) int id;

@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *coordinates_lat;
@property (nonatomic,retain) NSString *coordinates_lon;
@property (nonatomic,retain) NSString *address;
@property (nonatomic,retain) NSString *opening_hours_from_monday;
@property (nonatomic,retain) NSString *opening_hours_until_monday;
@property (nonatomic,retain) NSString *opening_hours_from_tuesday;
@property (nonatomic,retain) NSString *opening_hours_until_tuesday;
@property (nonatomic,retain) NSString *opening_hours_from_wednesday;
@property (nonatomic,retain) NSString *opening_hours_until_wednesday;
@property (nonatomic,retain) NSString *opening_hours_from_thursday;
@property (nonatomic,retain) NSString *opening_hours_until_thursday;
@property (nonatomic,retain) NSString *opening_hours_from_friday;
@property (nonatomic,retain) NSString *opening_hours_until_friday;
@property (nonatomic,retain) NSString *opening_hours_from_saturday;
@property (nonatomic,retain) NSString *opening_hours_until_saturday;
@property (nonatomic,retain) NSString *opening_hours_from_sunday;
@property (nonatomic,retain) NSString *opening_hours_until_sunday;
@property (nonatomic,retain) NSString *created;
@property (nonatomic,retain) NSString *updated;
@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *subtitle;

+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;
@end
