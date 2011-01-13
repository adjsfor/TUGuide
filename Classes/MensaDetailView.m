//
//  MensaDetailView.m
//  TUGuide
//
//  Created by Martin Langeder on 12.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MensaDetailView.h"


@implementation MensaDetailView

@synthesize logo, header, menu, contentTable;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
		
		UIColor *orange = [UIColor colorWithRed:.99 green:.65 blue:.11 alpha:1];
		UIColor *grey = [UIColor colorWithRed:.43 green:.43 blue:.43 alpha:1];
		
		UIImageView *headerBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, -20, 320, 120)];
		headerBackground.image = [UIImage imageNamed:@"HeaderBackGround"];
		[self addSubview:headerBackground];
		[headerBackground release];
		
		UIImage *img = [UIImage imageNamed: @"MensaLogo.png"];
		logo = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 70, 90)];
		logo.image = img;
		[img release];
		[self addSubview:logo];
		[logo release];
		
		header = [[UILabel alloc]initWithFrame:CGRectMake(100,50, 220, 50)];
		header.font = [UIFont fontWithName:@"Helvetica" size:20]; 
		header.textColor = orange;
		header.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
		[self addSubview:header];
		[header release];
		
		contentTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 320, 267)];
		[self addSubview:contentTable];
    }
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
