//
//  Announcement.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lecture.h"


@interface Announcement : NSObject {
	int announcementId;
	bool announced;
	Lecture *lectureId;
	int userId;
	NSString *message;
	NSString *report;
}

@property (nonatomic) int announcementId;
@property (nonatomic) bool announced;
@property (nonatomic,assign) Lecture *lectureId;
@property (nonatomic) int userId;
@property (nonatomic,assign) NSString *message;
@property (nonatomic,assign) NSString *report;


-(id)init;
-(id)initWithArguments:(int)announcementId
		 withAnnounced:(bool)announced
		 withLectureId:(Lecture *)lectureId
			withUserId:(int)userId
		   withMessage:(NSString *)message
			withReport:(NSString *)report;
@end
