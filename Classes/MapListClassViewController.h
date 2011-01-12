//
//  MapListClassViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 12.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapListDetailViewController.h"
#import "Classroom.h"
#import "Building.h"


@interface MapListClassViewController : UITableViewController {
	Classroom *classroom;
	Building *building;
	MapListDetailViewController *detailViewController;
}

@property (nonatomic, retain) Classroom *classroom;
@property (nonatomic, retain) Building *building;
@property (nonatomic, retain) MapListDetailViewController *detailViewController;

- (id)initWithBuilding: (Building *)b;
@end
