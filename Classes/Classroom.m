//
//  Classroom.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Classroom.h"


@implementation Classroom

@synthesize classroomId;
@synthesize name;
@synthesize building;

-(id)init;
-(id)initWithArguments:(int)classroomId2
			  withName:(NSString *)name2
		  withBuilding:(Building *)building2{
	
	if (self = [super init]) {
		self.classroomId = classroomId2;
		self.name = name2;
		self.building = building2;

	}
	return self;
}

-(id)init{
	return [self initWithArguments:0 withName:nil withBuilding:nil];
}

-(void)dealloc{
	[name release];
	[building release];
	[super dealloc];
}

@end
