//
//  MapListDetailView.h
//  TUGuide
//
//  Created by Martin Langeder on 07.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Classroom.h"


@interface MapListDetailView : UIView {
	
	UIImageView *logo;
	UILabel *header;
	UILabel *addressHeader;
	UILabel *address;
	UILabel *categoryHeader;
	UILabel *category;
	UILabel *locationHeader;
	UILabel *location;
	UIButton *showLocationButton;
	Classroom *classroom;
	
}

@property (nonatomic, retain) UIImageView *logo;
@property (nonatomic, retain) UILabel *header;
@property (nonatomic, retain) UILabel *addressHeader;
@property (nonatomic, retain) UILabel *address;
@property (nonatomic, retain) UILabel *categoryHeader;
@property (nonatomic, retain) UILabel *category;
@property (nonatomic, retain) UILabel *locationHeader;
@property (nonatomic, retain) UILabel *location;
@property (nonatomic, retain) UIButton *showLocationButton;
@property (nonatomic, retain) Classroom *classroom;

- (id)initWithFrame:(CGRect)frame andClassroom:(Classroom *)c;
@end
