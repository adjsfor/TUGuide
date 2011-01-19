//
//  Building.h
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Classroom.h"


@interface Building : NSObject <MKAnnotation>{
	NSString *name;
	NSString *address;
	NSNumber *coordinates_lat;
	NSNumber *coordinates_lon;
	NSString *link;
	int id;
	NSString *created;
	NSString *updated;
	NSMutableArray *classroomsList;
	NSString *title;
	NSString *subtitle;
}


@property (nonatomic) int id;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *address;
@property (nonatomic,retain) NSString *link;
@property (nonatomic,retain) NSString *created;
@property (nonatomic,retain) NSString *updated;
@property (nonatomic,retain) NSMutableArray* classroomsList;
@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *subtitle;
@property (nonatomic,retain) NSNumber *coordinates_lat;
@property (nonatomic,retain) NSNumber *coordinates_lon;


+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

@end
