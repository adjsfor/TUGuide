//
//  iMisseditDetailViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 20.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMisseditDetailView.h"
#import "Announcement.h"
#import "User.h"
#import "ServeriMissedIt.h"
#import "Lecture.h"
#import <EventKit/EventKit.h>

#include "UIAlertView_Extended.h"

@interface IMisseditDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate>{
	IMisseditDetailView *detailView;
	Announcement *announcement;
	User *me;
	ServeriMissedIt *serverConnection;
	EKEvent *event;
	NSMutableString *identifier;
	NSString *newAnnouncement;
}

@property (nonatomic, retain) IMisseditDetailView *detailView;
@property (nonatomic, retain) Announcement *announcement;
@property (nonatomic, retain) User *me;
@property (nonatomic, retain) ServeriMissedIt *serverConnection;
@property (nonatomic, retain) EKEvent *event;
@property (nonatomic, retain) NSMutableString *identifier;
@property (nonatomic, retain) NSString *newAnnouncement;


-(id)initWithEvent:(EKEvent *) e andUser:(User *)u;
-(void)addAnnouncement:(id)sender;

@end
