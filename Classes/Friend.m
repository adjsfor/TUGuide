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

-(void)dealloc{
	[super dealloc];
}

@end
