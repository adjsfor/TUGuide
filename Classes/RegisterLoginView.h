//
//  RegisterLoginView.h
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "RegisterView.h"
#import "UIViewDelegate.h"


@interface RegisterLoginView : UIScrollView {
	id <UIViewDelegate> delegate;
	UIButton *registerButton;
	UIButton *loginButton;
	UIImageView *bigLogo;
}

@property (nonatomic, retain) UIButton *registerButton;
@property (nonatomic, retain) UIButton *loginButton;
@property (nonatomic, retain) UIImageView *bigLogo;
// to be onwned by someone else
@property (nonatomic,assign) id <UIViewDelegate> delegate;


-(IBAction)loginButtonPressed:(id)sender;
-(IBAction)registerButtonPressed:(id)sender;

@end
