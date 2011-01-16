//
//  LecturesCalendarHelper.h
//  TUGuide
//
//  Created by Ivo Galic on 1/15/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "Classroom.h"

@interface LecturesCalendarHelper : NSObject {

}
+(void) displayMultiDimArray:(NSMutableArray*)array;
+(NSString*)getFormatedDate:(NSDate*)date;
+(Classroom *) searchClassroomByName:(NSMutableArray*)array name:(NSString*)string;
+(NSMutableArray*) getEKEventsFromCalendarWithPrefix:(NSString*)calprefix
										 startingDay:(int)startDay
										   endingDay:(int)endDay;
@end
