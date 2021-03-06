//
//  IMissedViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 19.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "LecturesCalendarHelper.h"
#import "MisseditDetailViewController.h"
#import "User.h"


@interface IMissedViewController : UITableViewController <UITableViewDelegate, EKEventEditViewDelegate, UINavigationControllerDelegate>{
	EKEventStore *eventStore;
	EKCalendar *defaultCalendar;
	NSMutableArray *eventsList;
	User *me;

}


@property (nonatomic, retain) EKEventStore *eventStore;
@property (nonatomic, retain) EKCalendar *defaultCalendar;
@property (nonatomic, retain) NSMutableArray *eventsList;
@property (nonatomic, retain) User *me;

- (id)initWithUser:(User *)u;
- (NSMutableArray *) fetchEventsForToday;
- (IBAction) addEvent:(id)sender;

@end
