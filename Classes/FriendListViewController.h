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
#import "getFriends.h"
#import "MessagePassProtocol.h"


@interface FriendListViewController : UITableViewController<MessagePassProtocol> {
	NSMutableArray *friendsArray;
	Friend *friend;
	User * me;
	MapListClassViewController *detailViewController;
	getFriends *serverConnection;
}

@property (nonatomic, retain) NSMutableArray *friendsArray;
@property (nonatomic, retain) Friend *friend;
@property (nonatomic, retain) MapListClassViewController *classViewController;
@property (nonatomic, retain) getFriends *serverConnection;
@property (nonatomic, retain) User * me;

- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
- (id)initWithFriends: (NSMutableArray *)f;
- (id) initWithUser:(User *)u;
-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg; 

@end
