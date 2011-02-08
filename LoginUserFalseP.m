//
//  LoginUserFalseP.m
//  TUGuide
//
//  Created by Jakub Kolesik on 20.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import "LoginUserFalseP.h"


@implementation LoginUserFalseP
@synthesize server,create;

- (void) loginUser {
	[self helperLoginUserWithName:@"M" andPassword:@"MM"];
}

-(void) helperCreateMethodWithName:(NSString *)name 
						   andMail:(NSString *)mail
					   andPassword:(NSString *)pass{
	create = [[ServerCreateUser alloc] init];
	create.delegate2 = self;
	
	[create createUserWithScreen_name:name withPassword:pass withMail:mail];
}

-(void) helperLoginUserWithName:(NSString *)name 
					andPassword:(NSString *)pass{
	server = [[ServerLogin alloc] init];
	server.delegate2 = self;
	
	[server loginUserWithScreen_name:name withPassword:pass];
}

-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg{
	
	if ([cmd isEqual:@"loginSuccessful"]) {
		STAssertTrue(NO,@"loginSuccessful schould be false!");
	}
	
	if ([cmd isEqual:@"registerSuccessful"]) {
	}
	
	if ([cmd isEqual:@"goRegister"]) {
	}
	
	if ([cmd isEqual:@"goLogin"]) {
		
	}
	
	if ([cmd isEqual:@"loginFromPreferences"]) {
	}
	
	
	// komment
	if ([cmd isEqual:@"loginFail"]) {
		STAssertTrue(YES,nil);
	}
	
	
	// failed to register
	if ([cmd isEqual:@"registerFail"]) {
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


