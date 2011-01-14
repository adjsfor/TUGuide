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
	
	UIColor *blue = [UIColor colorWithRed:.06 green:.165 blue:.60 alpha:1];
	UIColor *grey = [UIColor colorWithRed:.43 green:.43 blue:.43 alpha:1];
	
	//classroom = [[Classroom alloc]init];
	classroom = c;
    self.backgroundColor = [UIColor whiteColor];
	
	UIImageView *headerBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, 320, 120)];
	headerBackground.image = [UIImage imageNamed:@"HeaderBackGround"];
	[self addSubview:headerBackground];
	[headerBackground release];
	
	UIImage *img = [UIImage imageNamed: @"tulogo.png"];
	logo = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 70, 70)];
	logo.image = img;
	[img release];
	[self addSubview:logo];
	[logo release];
	
	header = [[UILabel alloc]initWithFrame:CGRectMake(100,70, 220, 20)];
	header.font = [UIFont fontWithName:@"Helvetica" size:20]; 
	header.textColor = blue;
	header.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
	[header setText:c.name];
	[self addSubview:header];
	[header release];
	
	addressHeader = [[UILabel alloc]initWithFrame:CGRectMake(30,130, 220, 20)];
	addressHeader.font = [UIFont fontWithName:@"Helvetica" size:16]; 
	addressHeader.textColor = blue;
	[addressHeader setText:@"Address"];
	[self addSubview:addressHeader];
	[addressHeader release];
    
	
	address = [[UILabel alloc]initWithFrame:CGRectMake(30,160, 220, 20)];
	address.font = [UIFont fontWithName:@"Helvetica" size:14]; 
	address.textColor = grey;
	[address setText:c.address];
	[self addSubview:address];
	[address release];
    
	
	categoryHeader = [[UILabel alloc]initWithFrame:CGRectMake(30,190, 220, 20)];
	categoryHeader.font = [UIFont fontWithName:@"Helvetica" size:16]; 
	categoryHeader.textColor = blue;
	[categoryHeader setText:@"Category"];
	[self addSubview:categoryHeader];
	[categoryHeader release];
    
	
	category = [[UILabel alloc]initWithFrame:CGRectMake(30,220, 220, 20)];
	category.font = [UIFont fontWithName:@"Helvetica" size:14]; 
	category.textColor = grey;
	[category setText:c.type];
	[self addSubview:category];
	[category release];
	
	
	locationHeader = [[UILabel alloc]initWithFrame:CGRectMake(30,250, 220, 20)];
	locationHeader.font = [UIFont fontWithName:@"Helvetica" size:16]; 
	locationHeader.textColor = blue;
	[locationHeader setText:@"Location"];
	[self addSubview:locationHeader];
	[locationHeader release];
    
	
	location = [[UILabel alloc]initWithFrame:CGRectMake(30,280, 220, 20)];
	location.font = [UIFont fontWithName:@"Helvetica" size:14]; 
	location.textColor = grey;
	[location setText:c.location];
	[self addSubview:location];
	[location release];
    
	showLocationButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[showLocationButton setFrame:CGRectMake(265, 140, 40, 40)];
	[showLocationButton setBackgroundImage:[UIImage imageNamed:@"bg_logo.png"] forState:UIControlStateNormal];
	[self addSubview:showLocationButton];
	//[showLocationButton release];
	
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
