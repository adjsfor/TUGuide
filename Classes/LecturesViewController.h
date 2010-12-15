//
//  LecturesViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 14.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import "LecturesDetailView.h"
#import "LecturesDetailViewController.h"
#import "UIViewControllerDelegate.h"

@interface LecturesViewController : UITableViewController <UINavigationBarDelegate, UITableViewDelegate, UINavigationControllerDelegate, UITableViewDataSource>{
	NSMutableArray *lectures;
	EKEventStore *eventStore;
	EKCalendar *defaultCalendar;
	LecturesDetailViewController *detailViewController;
	UISegmentedControl *segmentedControl;
	id <UIViewControllerDelegate>  delegate;

}

@property (nonatomic, retain) NSMutableArray *lectures;
@property (nonatomic, retain) EKEventStore *eventStore;
@property (nonatomic, retain) EKCalendar *defaultCalendar;
@property (nonatomic, retain) LecturesDetailViewController *detailViewController;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;
@property (assign) id <UIViewControllerDelegate> delegate;


- (NSArray *) fetchEventsForWeek;
- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
@end
