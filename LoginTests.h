//
//  LoginTests.h
//  TUGuide
//
//  Created by Jakub Kolesik on 01.12.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  Define USE_APPLICATION_UNIT_TEST to 0 if the unit test code is designed to be linked into an independent test executable.

#define USE_APPLICATION_UNIT_TEST 1

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "ServerLogin.h"



@interface LoginTests : SenTestCase {
	ServerLogin *server;
}

@property (nonatomic, retain) ServerLogin *server;

- (void) createUser;
- (void) createUserWithExistingMail;
- (void) createUserWithExistingScreenName;
- (void) createUserWithExistingMailAndScreenName;
- (void) loginUser;
- (void) loginUserWithFalseName;
- (void) loginUserWithFalsePassword;
- (void) loginUserWithFalsePasswordAndName;

-(BOOL) helperCreateMethodWithName:(NSString *)name 
						   andMail:(NSString *)mail 
					   andPassword:(NSString *)pass;

-(BOOL) helperLoginUserWithName:(NSString *)name 
					andPassword:(NSString *)pass;

@end
