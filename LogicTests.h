//
//  LogicTests.h
//  TUGuide
//
//  Created by Jakub Kolesik on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  Define USE_APPLICATION_UNIT_TEST to 0 if the unit test code is designed to be linked into an independent test executable.

//#define USE_APPLICATION_UNIT_TEST 1

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "RegisterLoginView.h"
#import "RegisterView.h"
#import "LoginView.h"
#import "Wizard.h"


@interface LogicTests : SenTestCase {
	RegisterLoginView *registerLoginView;
	RegisterView *registerView;
	LoginView *loginView;
	Wizard *wizard;
}

@property (nonatomic, retain) RegisterLoginView *registerLoginView;
@property (nonatomic, retain) RegisterView *registerView;
@property (nonatomic, retain) LoginView *loginView;
@property (nonatomic, retain) Wizard *wizard;
@end
