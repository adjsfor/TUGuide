//
//  OrganizerViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 12/28/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LecturesViewController.h"
#import "CoursesViewController.h"
#import "ToDoViewController.h"
#import "UIViewControllerDelegate.h"
#import "MessagePassProtocol.h"

@interface OrganizerViewController : UIViewController <UIViewControllerDelegate> {
	UISegmentedControl *segmentedController;
	LecturesViewController *lecturesViewController;
	CoursesViewController *coursesViewController;
	ToDoViewController *todoViewController;
	id <MessagePassProtocol> delegate2;
}

@property (nonatomic, retain) UISegmentedControl *segmentedController;
@property (nonatomic, retain) LecturesViewController *lecturesViewController;
@property (nonatomic, retain) CoursesViewController *coursesViewController;
@property (nonatomic, retain) ToDoViewController *todoViewController;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;


-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg;

@end