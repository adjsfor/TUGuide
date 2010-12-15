//
//  LoginTests.m
//  TUGuide
//
//  Created by Jakub Kolesik on 01.12.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "LoginTests.h"

@implementation LoginTests

@synthesize server;

- (void) createUser {
	BOOL test = [self helperCreateMethodWithName:@"Testing1" andMail:@"testing1@tuwien.ac.at" andPassword:@"456789"];
	STAssertTrue(test,@"The response for the create user did'n match!");
}

- (void) createUserWithExistingScreenName {
	BOOL test = [self helperCreateMethodWithName:@"Jakub" andMail:@"something@tuwien.ac.at" andPassword:@"987654"];
	STAssertFalse(test,@"The response for the create user did'n match!");
}

- (void) createUserWithExistingMail {
	BOOL test = [self helperCreateMethodWithName:@"XYZUser" andMail:@"testing1@tuwien.ac.at" andPassword:@"987654"];
	STAssertTrue(test,@"The response for the create user did'n match!");
}

- (void) createUserWithExistingMailAndScreenName {
	BOOL test = [self helperCreateMethodWithName:@"Testing1" andMail:@"testing1@tuwien.ac.at" andPassword:@"456789"];
	STAssertFalse(test,@"The response for the create user did'n match!");
}

- (void) loginUser {
	BOOL test = [self helperLoginUserWithName:@"adjokic" andPassword:@"1234"];
	STAssertTrue(test,@"The response for the login user did'n match!");
}

- (void) loginUserWithFalseName {
	BOOL test = [self helperLoginUserWithName:@"adjokicX" andPassword:@"1234"];
	STAssertFalse(test,@"The response for the login user did'n match!");
}

- (void) loginUserWithFalsePassword {
	BOOL test = [self helperLoginUserWithName:@"adjokic" andPassword:@"12345"];
	STAssertFalse(test,@"The response for the login user did'n match!");
}

- (void) loginUserWithFalsePasswordAndName {
	BOOL test = [self helperLoginUserWithName:@"adjokicX" andPassword:@"12345"];
	STAssertFalse(test,@"The response for the login user did'n match!");
}

-(BOOL) helperCreateMethodWithName:(NSString *)name 
						   andMail:(NSString *)mail
					   andPassword:(NSString *)pass{
	server = [[ServerLogin alloc] init];
	NSString *response = [server createUser2WithScreen_name:name withEmail:mail withPassword:pass];
	if (![response isEqualToString:nil]) {
		NSString *searchFor = @"screen_name";
		NSRange range = [response rangeOfString : searchFor];
		
		if (range.location != NSNotFound) {
			return YES;
		} else {
			return NO;
		}
		
	}else {
		return NO;
	}
}

-(BOOL) helperLoginUserWithName:(NSString *)name 
					andPassword:(NSString *)pass{
	server = [[ServerLogin alloc] init];
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

}

- (void) tearDown {
	[server release];
	[self dealloc];
}



@end
