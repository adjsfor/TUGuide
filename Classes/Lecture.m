//
//  Lecture.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Lecture.h"


@implementation Lecture

@synthesize lectureId;
@synthesize course;
@synthesize startTime;
@synthesize endTime;
@synthesize uId;
@synthesize classroom;

-(id)initWithArguments:(int)lectureId2
		  withCourse:(Course *)course2
		 withStartTime:(NSDate *)startTime2
		   withEndTime:(NSDate *)endTime2
			   withUId:(NSString *)uId2
	   withClassroom:(Classroom *)classroom2{
	
	if (self = [super init]) {
		self.lectureId = lectureId2;
		self.course = course2;
		self.startTime = startTime2;
		self.endTime = endTime2;
		self.uId = uId2;
		self.classroom = classroom2;
	}
	return self;
}

-(id)init{
	return [self initWithArguments:0 withCourse:nil withStartTime:nil withEndTime:nil withUId:nil withClassroom:nil];
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
	[course release];
	[startTime release];
	[endTime release];
	[uId release];
	[classroom release];
	[super dealloc];
}


@end
