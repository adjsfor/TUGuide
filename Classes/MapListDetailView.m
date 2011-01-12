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
	
	UIView *headerBackground = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
	headerBackground.backgroundColor = [UIColor blackColor];
	[self addSubview:headerBackground];
	[headerBackground release];
	
	UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
	logo = [[UIImageView alloc] initWithFrame:CGRectMake(20,40, 70, 70)];
	logo.image = img;
	[img release];
	[self addSubview:logo];
	[logo release];
	
	header = [[UILabel alloc]initWithFrame:CGRectMake(100,90, 220, 20)];
	header.font = [UIFont fontWithName:@"Helvetica" size:20]; 
	header.backgroundColor = [UIColor blackColor];
	header.textColor = [UIColor blueColor];
	[header setText:c.name];
	[self addSubview:header];
	[header release];
	
	addressHeader = [[UILabel alloc]initWithFrame:CGRectMake(30,130, 220, 20)];
	addressHeader.font = [UIFont fontWithName:@"Helvetica" size:16]; 
	addressHeader.textColor = [UIColor blueColor];
	[addressHeader setText:@"Address"];
	[self addSubview:addressHeader];
	[addressHeader release];
    
	
	address = [[UILabel alloc]initWithFrame:CGRectMake(30,160, 220, 20)];
	address.font = [UIFont fontWithName:@"Helvetica" size:14]; 
	[address setText:c.address];
	[self addSubview:address];
	[address release];
    
	
	categoryHeader = [[UILabel alloc]initWithFrame:CGRectMake(30,190, 220, 20)];
	categoryHeader.font = [UIFont fontWithName:@"Helvetica" size:16]; 
	categoryHeader.textColor = [UIColor blueColor];
	[categoryHeader setText:@"Category"];
	[self addSubview:categoryHeader];
	[categoryHeader release];
    
	
	category = [[UILabel alloc]initWithFrame:CGRectMake(30,220, 220, 20)];
	category.font = [UIFont fontWithName:@"Helvetica" size:14]; 
	[category setText:c.type];
	[self addSubview:category];
	[category release];
	
	
	locationHeader = [[UILabel alloc]initWithFrame:CGRectMake(30,250, 220, 20)];
	locationHeader.font = [UIFont fontWithName:@"Helvetica" size:16]; 
	locationHeader.textColor = [UIColor blueColor];
	[locationHeader setText:@"Location"];
	[self addSubview:locationHeader];
	[locationHeader release];
    
	
	location = [[UILabel alloc]initWithFrame:CGRectMake(30,280, 220, 20)];
	location.font = [UIFont fontWithName:@"Helvetica" size:14]; 
	[location setText:c.location];
	[self addSubview:location];
	[location release];
    
	showLocationButton = [UIButton buttonWithType:UIButtonTypeCustom];
	[showLocationButton setFrame:CGRectMake(280, 120, 30, 30)];
	[showLocationButton setBackgroundImage:[UIImage imageNamed:@"1map.png"] forState:UIControlStateNormal];
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
