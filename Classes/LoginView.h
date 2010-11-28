//
//  LoginView.h
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"


@interface LoginView : UIScrollView {
	
	int keyboardHight;
	UIButton *sendButton;
	UIButton *backButton;
	UIImageView *bigLogo;
	UITextField *emailField;
	UITextField *passwordField;
	UILabel *textLabel;
	UILabel *textLabel2;
	UISwitch *saveLogin;
	User *user;
	
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

- (IBAction)sendButtonAction:(id)sender;
- (IBAction)backButtonPressed:(id)sender;
- (IBAction)userDoneEnteringText:(id)sender;


@end
