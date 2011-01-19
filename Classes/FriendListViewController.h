//
//  FriendListViewController.h
//  TUGuide
//
//  Created by Jakub Kolesik on 19.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapListClassViewController.h"
#import "MapViewController.h"
#import "Classroom.h"
#import "Friend.h"


@interface FriendListViewController : UITableViewController {
	NSMutableArray *friendsArray;
	Friend *friend;
	MapListClassViewController *detailViewController;
}

@property (nonatomic, retain) NSMutableArray *friendsArray;
@property (nonatomic, retain) Friend *friend;
@property (nonatomic, retain) MapListClassViewController *classViewController;

- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
- (id)initWithFriends: (NSMutableArray *)f;
@end
