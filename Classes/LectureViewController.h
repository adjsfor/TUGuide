//
//  LectureViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 14.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import "LecturesDetailController.h"

@interface LectureViewController : UITableViewController <UINavigationBarDelegate, UITableViewDelegate, UINavigationControllerDelegate>{
	NSMutableArray *lectures;
	LecturesDetailController *detailViewController;
	EKEventStore *eventStore;
	EKCalendar *defaultCalendar;
	
}

@property (nonatomic, retain) NSMutableArray *lectures;
@property (nonatomic, retain) LecturesDetailController *detailViewController;
@property (nonatomic, retain) EKEventStore *eventStore;
@property (nonatomic, retain) EKCalendar *defaultCalendar;

- (NSArray *) fetchEventsForWeek;

@end
