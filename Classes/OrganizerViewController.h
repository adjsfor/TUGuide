//
//  OrganizerViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 12/28/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LecturesViewController.h"
#import "ToDoViewController.h"
#import "UIViewControllerDelegate.h"
#import "MessagePassProtocol.h"
#import "LecturesCalendarTableViewController.h"
#import "LecturesCalendarHelper.h"

@interface OrganizerViewController : UIViewController <UIViewControllerDelegate,UINavigationControllerDelegate,EKEventViewDelegate> {
	UISegmentedControl *segmentedController;
	LecturesCalendarTableViewController *lecturesViewController;
	ToDoViewController *todoViewController;
	id <MessagePassProtocol> delegate2;
	NSMutableArray *classrooms;
}

@property (nonatomic, retain) UISegmentedControl *segmentedController;
@property (nonatomic, retain) LecturesCalendarTableViewController *lecturesViewController;
@property (nonatomic, retain) ToDoViewController *todoViewController;
@property (nonatomic, retain) NSMutableArray *classrooms;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

-(OrganizerViewController *)initWithClassrooms:(NSMutableArray*)classes;
-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg;

@end