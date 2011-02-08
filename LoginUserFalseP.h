//
//  LoginUserFalseP.h
//  TUGuide
//
//  Created by Jakub Kolesik on 20.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  Define USE_APPLICATION_UNIT_TEST to 0 if the unit test code is designed to be linked into an independent test executable.

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "MessagePassProtocol.h"
#import "ServerLogin.h"
#import "ServerCreateUser.h";


@interface LoginUserFalseP : SenTestCase <MessagePassProtocol>{
	ServerLogin *server;
	ServerCreateUser *create;
}

@property (nonatomic, retain) ServerLogin *server;
@property (nonatomic, retain) ServerCreateUser *create;

-(void) helperCreateMethodWithName:(NSString *)name 
						   andMail:(NSString *)mail 
					   andPassword:(NSString *)pass;

-(void) helperLoginUserWithName:(NSString *)name 
					andPassword:(NSString *)pass;


@end