//
//  LecturesDetailView.h
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>


@interface LecturesDetailView : UIView {
	UIView *headerView;
	UILabel *headerLabelNumber;
	UILabel *headerLabelCourseName;
	UIImageView *logo;
	
}

@property (nonatomic, retain) UIView *headerView;
@property (nonatomic, retain) UILabel *headerLabelNumber;
@property (nonatomic, retain) UILabel *headerLabelCourseName;
@property (nonatomic, retain) UIImageView *logo;

@end


