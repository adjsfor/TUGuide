//
//  LocationViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 04.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"
#import "MapListViewController.h"

@interface LocationViewController : UIViewController {
	UISegmentedControl *segmentedController;
	MapViewController *mapViewController;
	MapListViewController *mapListViewController;
}

@property (nonatomic, retain) UISegmentedControl *segmentedController;
@property (nonatomic, retain) MapViewController *mapViewController;
@property (nonatomic, retain) MapListViewController *mapListViewController;


-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg;

@end