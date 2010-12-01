//
//  LoginView.h
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "ServerLogin.h"


@interface LoginView : UIScrollView {
	
	id <UIViewDelegate> delegate;
	int keyboardHight;
	UIButton *sendButton;
	UIImageView *bigLogo;
	UITextField *emailField;
	UITextField *passwordField;
	UILabel *textLabel;
	UILabel *textLabel2;
	UISwitch *saveLogin;
	User *user;
	ServerLogin *server;
	
}

@property (nonatomic) int keyboardHight;
@property (nonatomic, retain) UIButton *sendButton;
@property (nonatomic, retain) UIImageView *bigLogo;
@property (nonatomic, retain) UITextField *emailField;
@property (nonatomic, retain) UITextField *passwordField;
@property (nonatomic, retain) UILabel *textLabel;
@property (nonatomic, retain) UILabel *textLabel2;
@property (nonatomic, retain) UISwitch *saveLogin;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) ServerLogin *server;
@property (nonatomic,assign) id <UIViewDelegate> delegate;

- (IBAction)sendButtonAction:(id)sender;
- (IBAction)userDoneEnteringText:(id)sender;


@end
