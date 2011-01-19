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
	
	NSString *message;
	NSString *report;
	
	int id;
	NSString *when_announced;
	int lecture_id;
	int user_id;
	int uuid;
}

@property (nonatomic) int id;
@property (nonatomic) int lecture_id;
@property (nonatomic) int user_id;
@property (nonatomic) int uuid;

@property (nonatomic,retain) NSString *when_announced;
@property (nonatomic,retain) NSString *message;
@property (nonatomic,retain) NSString *report;



+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;
@end
