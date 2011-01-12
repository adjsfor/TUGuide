//
//  MapListViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 03.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapListClassViewController.h"
#import "MapViewController.h"
#import "Classroom.h"
#import "Building.h"


@interface MapListViewController : UITableViewController {
	NSMutableArray *buildingsArray;
	Classroom *classroom;
	Building *building;
	MapListClassViewController *detailViewController;
}

@property (nonatomic, retain) NSMutableArray *buildingsArray;
@property (nonatomic, retain) Classroom *classroom;
@property (nonatomic, retain) Building *building;
@property (nonatomic, retain) MapListClassViewController *classViewController;

- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
- (id)initWithBuildings: (NSMutableArray *)b;
@end
