//
//  MapListDetailView.m
//  TUGuide
//
//  Created by Martin Langeder on 07.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MapListDetailView.h"


@implementation MapListDetailView

@synthesize logo, header, addressHeader, address, categoryHeader, category, locationHeader, location, showLocationButton, classroom;


- (id)initWithFrame:(CGRect)frame andClassroom:(Classroom *)c{
    
    self = [super initWithFrame:frame];

	classroom = [[Classroom alloc]init];
	classroom = c;
    self.backgroundColor = [UIColor whiteColor];
	
	UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
	logo = [[UIImageView alloc] initWithFrame:CGRectMake(30,0, 240, 240)];
	logo.image = img;
	[img release];
	[self addSubview:logo];
	[logo release];
		
	header = [[UILabel alloc]initWithFrame:CGRectMake(100,240, 220, 30)];
	header.font = [UIFont fontWithName:@"Helvetica" size:11]; 
	header.textColor = [UIColor whiteColor];
	[header setText:c.name];
	[self addSubview:header];
	[header release];
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code.
 }
 */

- (void)dealloc {
    [super dealloc];
}


@end
