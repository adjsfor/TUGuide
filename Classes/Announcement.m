//
//  Announcement.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Announcement.h"


@implementation Announcement

@synthesize announcementId;
@synthesize announced;
@synthesize lectureId;
@synthesize userId;
@synthesize message;
@synthesize report;

-(id)initWithArguments:(int)announcementId2
		 withAnnounced:(bool)announced2
		 withLectureId:(NSString *)lectureId2
			withUserId:(int)userId2
		   withMessage:(NSString *)message2
			withReport:(NSString *)report2{
	
	if (self = [super init]) {
		self.announcementId = announcementId2;
		self.announced = announced2;
		self.lectureId = lectureId2;
		self.userId = userId2;
		self.message = message2;
		self.report = report2;
	}
	return self;
}

-(id)init{
	return [self initWithArguments:0 withAnnounced:nil withLectureId:nil withUserId:0 withMessage:nil withReport:nil];
}

-(void)dealloc{
	[lectureId release];
	[message release];
	[report release];
	[super dealloc];
}

@end
