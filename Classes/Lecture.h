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

@property (nonatomic) int lectureId;
@property (nonatomic,retain) Course *course;
@property (nonatomic,retain) NSDate *startTime;
@property (nonatomic,retain) NSDate *endTime;
@property (nonatomic,retain) NSString *uId;
@property (nonatomic,retain) Classroom *classroom;

-(id)init;
-(id)initWithArguments:(int)lectureId
		 withCourse:(Course *)course
		 withStartTime:(NSDate *)startTime
			withEndTime:(NSDate *)endTime
		   withUId:(NSString *)uId
			withClassroom:(Classroom *)classroom;

@end
