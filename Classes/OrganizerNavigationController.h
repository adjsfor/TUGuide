//
//  OrganizerNavigationController.h
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LecturesViewController.h"
#import "CoursesViewController.h"
#import "ToDoViewController.h"
#import "UIViewControllerDelegate.h"


@interface OrganizerNavigationController : UINavigationController <UIViewControllerDelegate>{
	UISegmentedControl *segmentedController;
	LecturesViewController *lecturesViewController;
	CoursesViewController *coursesViewController;
	ToDoViewController *todoViewController;
}

@property (nonatomic, retain) UISegmentedControl *segmentedController;
@property (nonatomic, retain) LecturesViewController *lecturesViewController;
@property (nonatomic, retain) CoursesViewController *coursesViewController;
@property (nonatomic, retain) ToDoViewController *todoViewController;


-(void)switchToController:(NSString *)controller animated:(BOOL)animated;
-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg;

@end
