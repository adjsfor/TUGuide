//
//  Lecture.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Course.h"
#import "Classroom.h"


@interface Lecture : NSObject {
	int lectureId;
	Course *course;
	NSDate *startTime;
	NSDate *endTime;
	NSString *uId;
	Classroom *classroom;

}

@property (nonatomic,assign) int lectureId;
@property (nonatomic,assign) Course *course;
@property (nonatomic,assign) NSDate *startTime;
@property (nonatomic,assign) NSDate *endTime;
@property (nonatomic,assign) NSString *uId;
@property (nonatomic,assign) Classroom *classroom;

-(id)init;
-(id)initWithArguments:(int)lectureId
		 withCourse:(Course *)course
		 withStartTime:(NSDate *)startTime
			withEndTime:(NSDate *)endTime
		   withUId:(NSString *)uId
			withClassroom:(Classroom *)classroom;

@end
