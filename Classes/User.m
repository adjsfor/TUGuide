//
//  User.m
//  TUGuide
//
//  Created by Martin Langeder on 27.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "User.h"


@implementation User

@synthesize username;
@synthesize email;
@synthesize password;


-(id)initWithEmailPasswordAndUsername:(NSString *)em password:(NSString *)pw user:(NSString *)u{
	if (self = [super init]) {
		[self setEmail:em];
		[self setPassword:pw];
		[self setUsername:u];
	}
	return self;
}

-(id)initWithEmailAndPassword:(NSString *)em password:(NSString *)pw{
	return [self initWithEmailPasswordAndUsername:em password:pw user:nil];
}

-(id)init{
	return [self initWithEmailPasswordAndUsername:nil password:nil user:nil];
}



@end
