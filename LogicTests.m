//
//  LogicTests.m
//  TUGuide
//
//  Created by Jakub Kolesik on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.

#import "LogicTests.h"


@implementation LogicTests

@synthesize registerLoginView;
@synthesize registerView;
@synthesize loginView;
@synthesize wizard;

- (void) setUpRegisterLoginView {
	registerLoginView = [[[RegisterLoginView alloc] init] retain];
	STAssertNotNil(registerLoginView, @"Could not create RegisterLoginView!");
}

- (void) setUpRegisterView {
	registerView = [[[RegisterView alloc] init] retain];
	STAssertNotNil(registerView, @"Could not create RegisterView!");
}

- (void) setUpLoginView {
	loginView = [[[LoginView alloc] init] retain];
	STAssertNotNil(loginView, @"Could not create LoginView!");
}

- (void) setUpWizardView {
	wizard = [[[RegisterLoginView alloc] init] retain];
	STAssertNotNil(wizard, @"Could not create Wizard!");
}

- (void) tearDown {
	[registerLoginView release];
	[registerView release];
	[loginView release];
	[wizard release];
}

@end
