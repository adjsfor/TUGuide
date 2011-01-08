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

+ (id)customClassWithProperties:(NSDictionary *)properties {
	return [[[self alloc] initWithProperties:properties] autorelease];
}

- (id)initWithProperties:(NSDictionary *)properties {
	if (self = [self init]) {
		[self setValuesForKeysWithDictionary:properties];
	}
	return self;
}

-(void)dealloc{
	[name release];
	[courseNumber release];
	[super dealloc];
}



@end
