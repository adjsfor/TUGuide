//
//  MapListViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 03.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewControllerDelegate.h"


@interface MapListViewController : UITableViewController {

	id <UIViewControllerDelegate>  delegate;
	
}

@property (assign) id <UIViewControllerDelegate> delegate;

- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
@end
