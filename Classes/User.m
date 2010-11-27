//
//  User.m
//  TUGuide
//
//  Created by Martin Langeder on 27.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "User.h"


@implementation User

@synthesize screenName;
@synthesize email;
@synthesize password;


-(id)initWithEmailPasswordAndScreenName:(NSString *)em password:(NSString *)pw screenName:(NSString *)u{
	if (self = [super init]) {
		[self setEmail:em];
		[self setPassword:pw];
		[self setScreenName:u];
	}
	return self;
}

-(id)initWithEmailAndPassword:(NSString *)em password:(NSString *)pw{
	return [self initWithEmailPasswordAndUsername:em password:pw screenName:nil];
}

-(id)init{
	return [self initWithEmailPasswordAndUsername:nil password:nil screenName:nil];
}

-(void)dealloc{
	[email release];
	[password release];
	[screenName release]
	[super dealloc];
}



@end
