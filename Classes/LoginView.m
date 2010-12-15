//
//  LoginView.m
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "LoginView.h"


@implementation LoginView

@synthesize sendButton;
@synthesize bigLogo;
@synthesize emailField;
@synthesize passwordField;
@synthesize textLabel;
@synthesize textLabel2;
@synthesize saveLogin;
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor whiteColor];
		self.userInteractionEnabled = YES;
		
		UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
		bigLogo = [[UIImageView alloc] initWithFrame:CGRectMake(30,0, 240, 240)];
		bigLogo.image = img;
		[img release];
		[self addSubview:bigLogo];
		[bigLogo release];
		
		textLabel = [[UILabel alloc]initWithFrame:CGRectMake(55,240, 220, 30)];
		textLabel.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel setText:@"Please login to use the services of TUGuide"];
		[self addSubview:textLabel];
		[textLabel release];
		
		emailField =[[UITextField alloc]initWithFrame:CGRectMake(20, 260, 280, 30)];
		emailField.borderStyle = UITextBorderStyleRoundedRect;
		emailField.placeholder = @"email";
		[emailField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[emailField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		[self addSubview:emailField];
		
		passwordField =[[UITextField alloc]initWithFrame:CGRectMake(20, 295, 280, 30)];
		passwordField.borderStyle = UITextBorderStyleRoundedRect;
		passwordField.placeholder = @"password";
		[passwordField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[passwordField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		passwordField.secureTextEntry = YES;
		[self addSubview:passwordField];
		
		sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[sendButton setFrame:CGRectMake(85, 370, 150, 30)];
		[sendButton setTitle:@"Send" forState:UIControlStateNormal];
		[sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[sendButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[sendButton addTarget:self action:@selector(sendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:sendButton];
		
		textLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(70,330, 150, 30)];
		textLabel2.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel2 setText:@"Save Login Data"];
		[self addSubview:textLabel2];
		[textLabel2 release];
		
		saveLogin = [[UISwitch alloc]initWithFrame:CGRectMake(170, 330, 30, 30)];
		[self addSubview:saveLogin];
    }
	return self;
}

- (void)exitTextField:(UITextField *)sender{
	[delegate actionButton:self command:@"exitTextField" message:@"textfiel entered"];
}

- (void)enterTextField:(UITextField *)sender{
	[delegate actionButton:self command:@"enterTextField" message:@"textfiel exited"];
}

-(void)sendButtonAction:(id)sender{
	[delegate actionButton:self command:@"goLogin" message:@"Versuchen zu einloggen"];
}

- (void)dealloc {
	[sendButton release];
	[emailField release];
	[passwordField release];
    [super dealloc];
	
}


@end
