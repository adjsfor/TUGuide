//
//  LecturesDetailView.m
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "LecturesDetailView.h"


@implementation LecturesDetailView
@synthesize headerView;
@synthesize headerLabelNumber;
@synthesize headerLabelCourseName;
@synthesize logo;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor whiteColor];
		self.userInteractionEnabled = YES;
		
		headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
		headerView.backgroundColor = [UIColor blackColor];
		
		headerLabelNumber = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, 100, 15)];
		//headerLabelNumber.text = @"134.414";
		headerLabelNumber.textColor = [UIColor whiteColor];
		headerLabelNumber.backgroundColor =[UIColor blackColor];
		headerLabelNumber.font = [UIFont fontWithName:@"Helvetica" size:18];
		
		headerLabelCourseName = [[UILabel alloc] initWithFrame:CGRectMake(80, 60, 240, 20)];
		//headerLabelCourseName.text = @"Advanced Software Engineering";
		headerLabelCourseName.textColor = [UIColor whiteColor];
		headerLabelCourseName.backgroundColor =[UIColor blackColor];
		headerLabelCourseName.font = [UIFont fontWithName:@"Helvetica" size:16];
		
		logo = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 60, 60)];
		logo.image = [UIImage imageNamed:@"TUGuideLogo.png"];
		
		
		[self addSubview:headerView];
		[self addSubview:headerLabelNumber];
		[self addSubview:headerLabelCourseName];
		[self addSubview:logo];
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
