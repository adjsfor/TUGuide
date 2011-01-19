//
//  LecturesCalendarHelper.m
//  TUGuide
//
//  Created by Ivo Galic on 1/15/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "LecturesCalendarHelper.h"

@implementation LecturesCalendarHelper

// smart algorithmus for searching because of TISS and Wegweiser inconsistence
// 1. equals
// 2. prefix -> two words
// 3. prefix reverse -> two words
// 4. two words only
// 5. suffix (only if first 4 fail)
+(Classroom *) searchClassroomByName:(NSMutableArray*)array name:(NSString*)string{
	//XLog("incoming search %@ ", string);
	Classroom *c;
	NSString *temp;
	NSRange match;
	if (array != nil) { 
		for (int i = 0; i<[array count]; i++) { // loop all classrooms
			c = [array objectAtIndex:i];
			temp = [self stripDoubleSpaceFrom:[c name]]; // remove double spaces in the name of classes
			//XLog("-->match<-- -%@- -%@- ", temp, string);
			
			if ([string isEqual:temp]) { // check other side prefix
				match = [string rangeOfString: temp];
				XLog("found match 1:1 %@ match: %i ", temp , match.length);
				return c;
				break;
			}
			
			if ([string hasPrefix:temp]) { // check other side prefix
				match = [string rangeOfString: temp];
				if([self compareTwoFirstWords:temp second:string]){
					XLog("--found match prefix %@ match: %i ", temp , match.length);
					return c;
					break;
				}
			}
			
			if ([temp hasPrefix:string]) { // check one side prefix
				if([self compareTwoFirstWords:temp second:string]){
					match = [string rangeOfString: temp];
					XLog("--found match prefix %@ match: %i ", temp , match.length);
					return c;
					break;
				}
			}
			
			if([self compareTwoFirstWords:temp second:string]){
				XLog("--found two words %@ ", temp );
				return c;
				break;
			}

		}
		
		// this is unsure but if 3 first fail then suffix is going 
		for (int i = 0; i<[array count]; i++) { // loop for suffix
			c = [array objectAtIndex:i];
			temp = [self stripDoubleSpaceFrom:[c name]];
			//XLog("-->match<-- -%@- -%@- ", temp, string);
			if ([string hasSuffix:temp]) { // check other side prefix
				match = [string rangeOfString: temp];
					XLog("--found match suffix %@ match: %i ", temp , match.length);
					return c;
					break;
			}
			
			if ([temp hasSuffix:string]) { // check one side prefix
					match = [string rangeOfString: temp];
					XLog("--found match suffix %@ match: %i ", temp , match.length);
					return c;
					break;
			}
		}
	}
	XLog("nothing found in search");
	return nil;
}

+(void) displayMultiDimArray:(NSMutableArray*)array{
	for (int i = 0; i<[array count]; i++) {
		XLog("----> %i", i);
		for (int n = 0; n<[[array objectAtIndex:i] count]; n++) {
			EKEvent * ek;
			ek = [[array objectAtIndex:i] objectAtIndex:n];
			XLog("--------> %@ ",[ek eventIdentifier] );
			//XLog("--------> %i %@", n,[[array objectAtIndex:i] objectAtIndex:n]);
		}
	}
}

+(NSString*)getFormatedDate:(NSDate*)date formatter:(NSString*)format{
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setDateFormat:format];
	
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
	
	//[self displayMultiDimArray:section_events];
	//[eventStore release];
	[dateFormatter release];
	return section_events;
	
}

+ (NSString *)stripDoubleSpaceFrom:(NSString *)str {
    while ([str rangeOfString:@"  "].location != NSNotFound) {
        str = [str stringByReplacingOccurrencesOfString:@"  " withString:@" "];
    }
    return str;
}

+ (BOOL)compareTwoFirstWords:(NSString *)first second:(NSString*)second{
	NSArray *chunks1 = [first componentsSeparatedByString: @" "];
	NSArray *chunks2 = [second componentsSeparatedByString: @" "];
	if(chunks1!=nil && chunks2!=nil){
		if([chunks1 count]>1 && [chunks2 count]>1){
			NSString * f1 = [chunks1 objectAtIndex:0];
			NSString * f2 = [chunks1 objectAtIndex:1];
			NSString * s1 = [chunks2 objectAtIndex:0];
			NSString * s2 = [chunks2 objectAtIndex:1];
			if ([f1 isEqual:s1] && [f2 isEqual:s2]) {
				return YES;
			}else {
				return NO;
			}

		}else{
			return NO;
		}
	}else {
		return NO;
	}


}



@end
