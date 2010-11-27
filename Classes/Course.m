//
//  Course.m
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 TuGuide. All rights reserved.
//

#import "Course.h"


@implementation Course


@synthesize courseId;
@synthesize name;
@synthesize courseNumber;


-(id)init{
	if (self = [super init]) {
		//dosomething
	}
	return self;
}

-(void)dealloc{
	[name release];
	[courseNumber release];
	[super dealloc];
}



@end
