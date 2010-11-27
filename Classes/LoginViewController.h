//
//  LoginViewController.h
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterView.h"
#import "LoginView.h"
#import "RegisterLoginView.h"


@interface LoginViewController : UIViewController {
	
	RegisterLoginView *registerLoginView;
	RegisterView *registerView;
	LoginView *loginView;
	UIScrollView *scrollView;
	UITextField *activeField;
	Boolean keyboardIsShown;
}

@property (nonatomic, retain) RegisterLoginView *registerLoginView;
@property (nonatomic, retain) RegisterView *registerView;
@property (nonatomic, retain) LoginView *loginView;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UITextField *activeField;


@end
