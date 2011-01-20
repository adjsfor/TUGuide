//
//  LoginTests.m
//  TUGuide
//
//  Created by Jakub Kolesik on 01.12.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "LoginTests.h"


@implementation LoginTests

@synthesize server,create;

- (void) createUser {
	[self helperCreateMethodWithName:@"Testing1" andMail:@"testing1@tuwien.ac.at" andPassword:@"456789"];
	//STAssertTrue(test,@"The response for the create user did'n match!");
}

- (void) createUserWithExistingScreenName {
	[self helperCreateMethodWithName:@"Jakub" andMail:@"something@tuwien.ac.at" andPassword:@"987654"];
	//STAssertFalse(test,@"The response for the create user did'n match!");
}

- (void) createUserWithExistingMail {
	[self helperCreateMethodWithName:@"XYZUser" andMail:@"testing1@tuwien.ac.at" andPassword:@"987654"];
	//STAssertTrue(test,@"The response for the create user did'n match!");
}

- (void) createUserWithExistingMailAndScreenName {
	[self helperCreateMethodWithName:@"Testing1" andMail:@"testing1@tuwien.ac.at" andPassword:@"456789"];
	//STAssertFalse(test,@"The response for the create user did'n match!");
}

- (void) loginUser {
	[self helperLoginUserWithName:@"adjokic" andPassword:@"1234"];
	//STAssertTrue(test,@"The response for the login user did'n match!");
}

- (void) loginUserWithFalseName {
	[self helperLoginUserWithName:@"adjokicX" andPassword:@"1234"];
	//STAssertFalse(test,@"The response for the login user did'n match!");
}

- (void) loginUserWithFalsePassword {
	[self helperLoginUserWithName:@"adjokic" andPassword:@"12345"];
	//STAssertFalse(test,@"The response for the login user did'n match!");
}

- (void) loginUserWithFalsePasswordAndName {
	[self helperLoginUserWithName:@"adjokicX" andPassword:@"12345"];
	//STAssertFalse(test,@"The response for the login user did'n match!");
}

-(void) helperCreateMethodWithName:(NSString *)name 
						   andMail:(NSString *)mail
					   andPassword:(NSString *)pass{
	create = [[ServerCreateUser alloc] init];
	[create createUserWithScreen_name:name withPassword:pass withMail:mail];
}

-(void) helperLoginUserWithName:(NSString *)name 
					andPassword:(NSString *)pass{
	/*server = [[ServerLogin alloc] init];
	NSString *response = [server loginUser2WithScreen_name:name withPassword:pass];
	if (![response isEqualToString:nil]) {
		NSString *searchFor = @"session_id";
		NSRange range = [response rangeOfString : searchFor];
		
		if (range.location != NSNotFound) {
			return YES;
		}else {
			return NO;
		}

	}else {
		return NO;
	}
	 */

}

-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg{
	
	if ([cmd isEqual:@"loginSuccessful"]) {
		
	}
	
	if ([cmd isEqual:@"registerSuccessful"]) {
		
	}
	
	if ([cmd isEqual:@"goRegister"]) {
	}
	
	// startLoginEvent in ServerLogin with email und password
	if ([cmd isEqual:@"goLogin"]) {

	}
	
	if ([cmd isEqual:@"loginFromPreferences"]) {
	}
	
	
	// komment
	if ([cmd isEqual:@"loginFail"]) {
		
	}
	
	
	// failed to register
	if ([cmd isEqual:@"registerFail"]) {
		
	}
	
	
	// server offline
	if ([cmd isEqual:@"serverOffline"]) {
		
	}
	return YES;	
}

- (void) tearDown {
	[server release];
	[create release];
	[self dealloc];
}



@end
