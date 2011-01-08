//
//  Friend.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Friend.h"


@implementation Friend

@synthesize beFriendId;
@synthesize friendId;
@synthesize approved;


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
	[super dealloc];
}

@end
