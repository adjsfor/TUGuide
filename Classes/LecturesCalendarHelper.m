//
//  LecturesCalendarHelper.m
//  TUGuide
//
//  Created by Ivo Galic on 1/15/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "LecturesCalendarHelper.h"


@implementation LecturesCalendarHelper

+(Classroom *) searchClassroomByName:(NSMutableArray*)array name:(NSString*)string{
	Classroom *c;
	if (array != nil) {
		for (int i = 0; i<[array count]; i++) {
			c = [array objectAtIndex:i];
			if ([[c name] hasPrefix:string]) {
				XLog("--searching classroom %@ ", [c name]);
				break;
			}

		}
		}
	XLog("searching classroom %@ ", [c name]);
	return c;
}

+(void) displayMultiDimArray:(NSMutableArray*)array{
	for (int i = 0; i<[array count]; i++) {
		XLog("----> %i", i);
		for (int n = 0; n<[[array objectAtIndex:i] count]; n++) {
			XLog("--------> %i %@", n,[[array objectAtIndex:i] objectAtIndex:n]);
		}
	}
}

+(NSString*)getFormatedDate:(NSDate*)date{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setDateFormat:@"EEEE dd/MM/yyyy"];
	
	NSString *formattedDateString = [dateFormatter stringFromDate:date];
	
	[dateFormatter release];
	return formattedDateString;
	
//	NSCalendar *calendar= [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//			NSCalendarUnit unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
//			//NSDate *date = [NSDate date];
//			NSDateComponents *dateComponents = [calendar components:unitFlags fromDate:date];
//			
//			NSInteger year = [dateComponents year];
//			NSInteger month = [dateComponents month];
//			NSInteger day = [dateComponents day];
//	
//			go = day;
//			[calendar release];
//			XLog(" ->>>>>>>  Day:%i Month:%i Year:%i ",day, month,year);
}

+(NSMutableArray*) getEKEventsFromCalendarWithPrefix:(NSString*)calprefix
										 startingDay:(int)startDay
										   endingDay:(int)endDay
{
	EKEventStore * eventStore = [[EKEventStore alloc] init];
	NSMutableArray * relevant_calendars =  [[NSMutableArray alloc]init];
	NSEnumerator *e = [[eventStore calendars] objectEnumerator];
	EKCalendar *object;
	while (object = (EKCalendar *)[e nextObject]) {
		NSString *compare = object.title;
		if ([compare hasPrefix:calprefix]) {
			//XLog(@"->>>>>>>> %@",object.title);
			[relevant_calendars addObject:object];
		}
	}
	
	// Create the predicate's start and end dates.
	CFGregorianDate gregorianStartDate, gregorianEndDate;
	CFGregorianUnits startUnits = {0, 0, startDay, 0, 0, 0};
	CFGregorianUnits endUnits = {0, 0, endDay, 0, 0, 0};
	CFTimeZoneRef timeZone = CFTimeZoneCopySystem();
	gregorianStartDate = CFAbsoluteTimeGetGregorianDate(
														CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTimeGetCurrent(), timeZone, startUnits),
														timeZone);
	gregorianStartDate.hour = 0;
	gregorianStartDate.minute = 0;
	gregorianStartDate.second = 0;
	gregorianEndDate = CFAbsoluteTimeGetGregorianDate(
													  
													  CFAbsoluteTimeAddGregorianUnits(CFAbsoluteTimeGetCurrent(), timeZone, endUnits),
													  timeZone);
	gregorianEndDate.hour = 0;
	gregorianEndDate.minute = 0;
	gregorianEndDate.second = 0;
	
	NSDate* startDate =   [NSDate dateWithTimeIntervalSinceReferenceDate:CFGregorianDateGetAbsoluteTime(gregorianStartDate, timeZone)];
	NSDate* endDate =   [NSDate dateWithTimeIntervalSinceReferenceDate:CFGregorianDateGetAbsoluteTime(gregorianEndDate, timeZone)];
	
	CFRelease(timeZone);
	
	// Create the predicate.
	NSPredicate *predicate = [eventStore predicateForEventsWithStartDate:startDate endDate:endDate calendars:relevant_calendars]; // eventStore is an instance variable.
	[relevant_calendars release];
	
	// Fetch all events that match the predicate.
	NSArray *events = [eventStore eventsMatchingPredicate:predicate];
	
	//[self setEvents:events];
	NSMutableArray *section_events = [NSMutableArray array];
	//[section_events addObject:inside_section_events];
	
	NSEnumerator *e1 = [events objectEnumerator];
	EKEvent *object1;
	NSDate *date;
	NSString *compare = @"compare";
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setDateFormat:@"Ymd"];
	
	int counter = 0;
	while (object1 = (EKEvent *)[e1 nextObject]) {
		date = object1.startDate;
		NSString *formattedDateString = [dateFormatter stringFromDate:date];
		if ([compare isEqual:formattedDateString] ) {
			//[inside_section_events addObject:object1];
			[[section_events objectAtIndex:counter] addObject:object1];
			//XLog(@" %@ ",formattedDateString);
		}else {
			if(![compare isEqual:@"compare"]){
				//XLog(@" DRUGACIJE %@ ",formattedDateString);
				counter++;
				[section_events addObject:[NSMutableArray array]];
				[[section_events objectAtIndex:counter] addObject:object1];
			}else {
				[section_events addObject:[NSMutableArray array]];
				[[section_events objectAtIndex:counter] addObject:object1];
				//XLog(@"Init %@ ",formattedDateString);
			}
		}
		
		compare = formattedDateString;
		
	}
	
	[dateFormatter release];
	return section_events;
	
}




@end
