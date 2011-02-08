//
//  CreateUserExistingMailScreenName.m
//  TUGuide
//
//  Created by Jakub Kolesik on 20.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import "CreateUserExistingMailScreenName.h"


@implementation CreateUserExistingMailScreenName

@synthesize server,create;

- (void) createUserTest {
	[self helperCreateMethodWithName:@"testingUser" andMail:@"test@tuwien.at" andPassword:@"XX"];
}


-(void) helperCreateMethodWithName:(NSString *)name 
						   andMail:(NSString *)mail
					   andPassword:(NSString *)pass{
	create = [[ServerCreateUser alloc] init];
	create.delegate2 = self;
	
	[create createUserWithScreen_name:name withPassword:pass withMail:mail];
}

-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg{
	
	if ([cmd isEqual:@"loginSuccessful"]) {
	}
	
	if ([cmd isEqual:@"registerSuccessful"]) {
		STAssertTrue(NO,nil);
	}
	
	if ([cmd isEqual:@"goRegister"]) {
	}
	
	if ([cmd isEqual:@"goLogin"]) {
		
	}
	
	if ([cmd isEqual:@"loginFromPreferences"]) {
	}
	
	
	// komment
	if ([cmd isEqual:@"loginFail"]) {
	}
	
	
	// failed to register
	if ([cmd isEqual:@"registerFail"]) {
		STAssertTrue(YES,@"serverOffline");
	}
	
	
	// server offline
	if ([cmd isEqual:@"serverOffline"]) {
		STAssertTrue(NO,@"serverOffline");
	}
	return YES;	
}

- (void) tearDown {
	[server release];
	[create release];
	[self dealloc];
}


@end
