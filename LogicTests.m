//
//  LogicTests.m
//  TUGuide
//
//  Created by Jakub Kolesik on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.

#import "LogicTests.h"


@implementation LogicTests

@synthesize registerLoginView;


- (void) setUp {
	registerLoginView = [[[RegisterLoginView alloc] init] retain];
	STAssertNotNil(registerLoginView, @"Could not create RegisterLoginView!");
}

- (void) tearDown {
	[registerLoginView release];
}

@end
