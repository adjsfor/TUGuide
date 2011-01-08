//
//  Classroom.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Building.h"

@interface Classroom : NSObject {
	int classroomId;
	NSString *address;
	NSString *name;
	NSString *location;
	NSString *type;
	NSString *pdf_link_wegweiser;
	NSString *pdf_link_cms;
	NSString *link;
	int id;
	NSString *created;
	NSString *updated;
	int building_id;
	
	//Building *building;
}

@property (nonatomic) int classroomId;
@property (nonatomic) int id;
@property (nonatomic) int building_id;

@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *address;
@property (nonatomic,retain) NSString *location;
@property (nonatomic,retain) NSString *type;
@property (nonatomic,retain) NSString *pdf_link_wegweiser;
@property (nonatomic,retain) NSString *pdf_link_cms;
@property (nonatomic,retain) NSString *link;
@property (nonatomic,retain) NSString *created;
@property (nonatomic,retain) NSString *updated;

//@property (nonatomic,retain) Building *building;

+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

@end