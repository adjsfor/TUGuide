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


@interface IMisseditDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
	IMisseditDetailView *detailView;
	Announcement *announcement;

}

@property (nonatomic, retain) IMisseditDetailView *detailView;
@property (nonatomic, retain) Announcement *announcement;

-(id)initWithAnnouncements:(Announcement *) a;

@end
