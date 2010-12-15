//
//  CoursesViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewControllerDelegate.h"


@interface CoursesViewController : UITableViewController <UINavigationBarDelegate, UITableViewDelegate, UINavigationControllerDelegate, UITableViewDataSource>{
	id <UIViewControllerDelegate>  delegate;
	UISegmentedControl *segmentedControl;


}
@property (assign) id <UIViewControllerDelegate> delegate;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;

- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;

@end
