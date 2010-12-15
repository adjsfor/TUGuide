//
//  RegisterViewController.h
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
#import "ServerCreateUser.h"



@interface RegisterViewController : UIViewController <UITextFieldDelegate,UIViewDelegate>{

	RegisterView *registerView;
	User *user;
	ServerCreateUser *server;
	id <UIViewControllerDelegate>  delegate;
	int keyboardHight;
	
}

@property (nonatomic, retain) RegisterView *registerView;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) ServerCreateUser *server;
@property (assign) id <UIViewControllerDelegate> delegate;

-(void)actionButton:(UIView *)requestor command:(NSString *)cmd message:(NSString *)msg; 

@end