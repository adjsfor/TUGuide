//
//  RegisterLoginViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 11/30/10.
//  Copyright 2010 Galic Design. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "RegisterView.h"
#import "LoginView.h"
#import "RegisterLoginView.h"
#import "Wizard.h"
#import "UIViewControllerDelegate.h"
#import "UIViewDelegate.h"


@interface RegisterLoginViewController : UIViewController <UIViewDelegate,UIScrollViewDelegate,UITableViewDelegate>{
	
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
// to be onwned by someone else
@property (assign) id <UIViewControllerDelegate> delegate;

-(void)actionButton:(UIView *)requestor command:(NSString *)cmd message:(NSString *)msg; 

@end
