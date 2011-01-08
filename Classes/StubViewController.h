//
//  StubViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 1/7/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewControllerDelegate.h"

@interface StubViewController : UITableViewController {
	id <UIViewControllerDelegate>  delegate;
	UISegmentedControl *segmentedControl;
	
}
@property (assign) id <UIViewControllerDelegate> delegate;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;

- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;

@end
