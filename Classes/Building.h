//
//  Building.h
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Classroom.h"


@interface Building : NSObject {
	NSString *name;
	NSString *address;
	NSString *coordinates_lat;
	NSString *coordinates_lon;
	NSString *link;
	int id;
	NSString *created;
	NSString *updated;
	NSMutableArray *classroomsList;
}


@property (nonatomic) int id;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *address;
@property (nonatomic,retain) NSString *coordinates_lat;
@property (nonatomic,retain) NSString *coordinates_lon;
@property (nonatomic,retain) NSString *link;
@property (nonatomic,retain) NSString *created;
@property (nonatomic,retain) NSString *updated;
@property (nonatomic,retain) NSMutableArray* classroomsList;


+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

@end
