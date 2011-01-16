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
#import "LecturesCalendarHelper.h"
#import "LecturesDetailViewController.h"
	
@interface LecturesCalendarTableViewController : UITableViewController <UINavigationBarDelegate, UITableViewDelegate, 
	EKEventEditViewDelegate, UINavigationControllerDelegate, UIActionSheetDelegate> {
		
		LecturesDetailViewController *detailViewController;
		EKEventStore *eventStore;
		EKCalendar *defaultCalendar;
		NSMutableArray *eventsList;
		id <UIViewControllerDelegate> delegate2;
		NSMutableArray *classrooms;
	}
	
	@property (nonatomic, retain) EKEventStore *eventStore;
	@property (nonatomic, assign) id <UIViewControllerDelegate> delegate2;
	@property (nonatomic, retain) EKCalendar *defaultCalendar;
	@property (nonatomic, retain) NSMutableArray *eventsList;
	@property (nonatomic, retain) LecturesDetailViewController *detailViewController;
	@property (nonatomic, retain) NSMutableArray *classrooms;
	
- (NSMutableArray *) fetchEventsForToday;
- (IBAction) addEvent:(id)sender;
- (LecturesCalendarTableViewController *)initWithClassrooms:(NSMutableArray*)classes;

@end
	
