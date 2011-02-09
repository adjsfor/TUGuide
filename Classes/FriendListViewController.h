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
#import "DeleteAddFriend.h"
#include "UIAlertView_Extended.h"

@interface FriendListViewController : UITableViewController<MessagePassProtocol,UIAlertViewDelegate> {
	NSMutableArray *friendsArray;
	Friend *friend;
	User * me;
	MapListClassViewController *detailViewController;
	getFriends *serverConnection;
	DeleteAddFriend *serverCon;
	NSString *selected_temp;
	int add_del; // add 1 // del 0
	id <MessagePassProtocol> delegate2;
}

@property (nonatomic, retain) NSMutableArray *friendsArray;
@property (nonatomic, retain) Friend *friend;
@property (nonatomic, retain) MapListClassViewController *classViewController;
@property (nonatomic, retain) getFriends *serverConnection;
@property (nonatomic, retain) User * me;
@property (nonatomic, retain) DeleteAddFriend *serverCon;
@property (nonatomic, retain) NSString *selected_temp;
@property (nonatomic,assign) id <MessagePassProtocol> delegate2;

- (IBAction)segmentAction:(UISegmentedControl *)segmentPick;
- (id) initWithUser:(User *)u;
-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg; 

@end
