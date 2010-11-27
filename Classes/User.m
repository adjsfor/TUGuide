//
//  User.m
//  TUGuide
//
//  Created by Ivo Galic on 27.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "User.h"


@implementation User

@synthesize userId;
@synthesize screenName;
@synthesize email;
@synthesize password;
@synthesize coordinates;
@synthesize verificationString;
@synthesize activated;
@synthesize sessionId;
@synthesize lastLogin;
@synthesize friendList;


-(id)initWithArguments:(NSString *)em withPassword:(NSString *)pw withScreenName:(NSString *)u{
	if (self = [super init]) {
		[self setEmail:em];
		[self setPassword:pw];
		[self setScreenName:u];
	}
	return self;	
}

-(id)initWithEmailAndPassword:(NSString *)em withPassword:(NSString *)pw{
	return [self initWithArguments:em withPassword:pw withScreenName:nil];
}

-(id)init{
	return [self initWithArguments:nil withPassword:nil withScreenName:nil];
}

-(void)dealloc{
	[screenName release];
	[email release];
	[password release];
	[coordinates release];
	[verificationString release];
	[sessionId release];
	[lastLogin release];
	[friendList release];
	[super dealloc];
}



@end
