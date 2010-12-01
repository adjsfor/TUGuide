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
	server = [[ServerLogin alloc] init];
	//[server initAll];
	//STAssertNotNil(server, @"Could not create RegisterLoginView!");
}



@end
