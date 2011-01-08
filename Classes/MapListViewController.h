//
//  MapListViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 03.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapListDetailViewController.h"
#import "MapViewController.h"


@interface MapListViewController : UITableViewController {
	
}

- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
@end
