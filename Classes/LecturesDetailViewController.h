//
//  LecturesDetailViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LecturesDetailView.h"
#import "UIViewControllerDelegate.h"
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>
#import "LecturesCalendarHelper.h"


@interface LecturesDetailViewController : EKEventViewController  {
	LecturesDetailView *detailView;
	id <UIViewControllerDelegate> delegate2;
	NSMutableArray *classrooms;
}

@property (nonatomic, retain) LecturesDetailView *detailView;
@property (nonatomic, assign) id <UIViewControllerDelegate> delegate2;
@property (nonatomic, retain) NSMutableArray *classrooms;

- (LecturesDetailViewController *)initWithClassrooms:(NSMutableArray*)classes;
@end


