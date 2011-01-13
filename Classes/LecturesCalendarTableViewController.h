//
//  LecturesCalendarTableViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 1/13/11.
//  Copyright 2011 Galic Design. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "UIViewControllerDelegate.h"
	
@interface LecturesCalendarTableViewController : UITableViewController <UINavigationBarDelegate, UITableViewDelegate, 
	EKEventEditViewDelegate, UINavigationControllerDelegate, UIActionSheetDelegate> {
		
		EKEventViewController *detailViewController;
		EKEventStore *eventStore;
		EKCalendar *defaultCalendar;
		NSMutableArray *eventsList;
		id <UIViewControllerDelegate> delegate2;
	}
	
	@property (nonatomic, retain) EKEventStore *eventStore;
	@property (nonatomic, assign) id <UIViewControllerDelegate> delegate2;
	@property (nonatomic, retain) EKCalendar *defaultCalendar;
	@property (nonatomic, retain) NSMutableArray *eventsList;
	@property (nonatomic, retain) EKEventViewController *detailViewController;
	
- (NSArray *) fetchEventsForToday;
- (IBAction) addEvent:(id)sender;
- (void)initTiss;
@end
	
