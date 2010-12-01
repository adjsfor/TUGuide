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
#import "Wizard.h"
#import "UIViewControllerDelegate.h"
#import "UIViewDelegate.h"


@interface LoginViewController : UIViewController <UITextFieldDelegate,UIViewDelegate>{
	
	RegisterLoginView *registerLoginView;
	RegisterView *registerView;
	LoginView *loginView;
	UIScrollView *scrollView;
	UITextField *activeField;
	Boolean keyboardIsShown;
	Wizard * wizard;
	id <UIViewControllerDelegate>  delegate;
}

@property (nonatomic, retain) RegisterLoginView *registerLoginView;
@property (nonatomic, retain) RegisterView *registerView;
@property (nonatomic, retain) LoginView *loginView;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UITextField *activeField;
@property (nonatomic, retain) Wizard *wizard;

@property (assign) id <UIViewControllerDelegate> delegate;

-(void)actionButton:(UIView *)requestor command:(NSString *)cmd message:(NSString *)msg; 


@end
