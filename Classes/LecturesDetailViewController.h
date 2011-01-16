//
//  LecturesDetailViewController.h
//  TUGuide
//
//  Created by Ivo Galic
//  Copyright Galic Design All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LecturesDetailView.h"
#import "UIViewControllerDelegate.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "LecturesCalendarHelper.h"
#import "MapListDetailView.h"
#import "LocationDetailViewController.h"

@interface LecturesDetailViewController : EKEventViewController <UITableViewDelegate>  {
	
	id <UIViewControllerDelegate> delegate2;
	Classroom *classroom;
	NSMutableArray *classrooms;
}

@property (nonatomic, assign) id <UIViewControllerDelegate> delegate2;
@property (nonatomic, retain) NSMutableArray *classrooms;
@property (nonatomic, retain) Classroom *classroom;
- (LecturesDetailViewController *)initWithClassrooms:(NSMutableArray*)classes;
@end


