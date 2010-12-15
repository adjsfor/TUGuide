//
//  RegisterView.m
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "RegisterView.h"


@implementation RegisterView

@synthesize usernameField;
@synthesize bigLogo;
@synthesize emailField;
@synthesize passwordField;
@synthesize passwordField2;
@synthesize sendButton;
@synthesize textLabel;
@synthesize textLabel2;
@synthesize delegate;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		self.backgroundColor = [UIColor whiteColor];
		self.userInteractionEnabled = YES;
		
		UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
		bigLogo = [[UIImageView alloc] initWithFrame:CGRectMake(85,0, 150, 150)];
		bigLogo.image = img;
		[img release];
		[self addSubview:bigLogo];
		[bigLogo release];
		
		textLabel = [[UILabel alloc]initWithFrame:CGRectMake(55,155, 220, 30)];
		textLabel.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel setText:@"Register for the Services of TUGuide"];
		[self addSubview:textLabel];
		[textLabel release];
		
		usernameField =[[UITextField alloc]initWithFrame:CGRectMake(20, 195, 280, 30)];
		usernameField.borderStyle = UITextBorderStyleRoundedRect;
		usernameField.placeholder = @"Username";
		[usernameField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[usernameField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		[self addSubview:usernameField];
		
		emailField =[[UITextField alloc]initWithFrame:CGRectMake(20, 235, 280, 30)];
		emailField.borderStyle = UITextBorderStyleRoundedRect;
		emailField.placeholder = @"ends with @*tuwien.ac.at";
		[emailField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[emailField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		[self addSubview:emailField];
		
		passwordField =[[UITextField alloc]initWithFrame:CGRectMake(20, 275, 280, 30)];
		passwordField.borderStyle = UITextBorderStyleRoundedRect;
		passwordField.placeholder = @"Password";
		passwordField.secureTextEntry = YES;
		[passwordField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[passwordField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		[self addSubview:passwordField];
		
		passwordField2 =[[UITextField alloc]initWithFrame:CGRectMake(20, 315, 280, 30)];
		passwordField2.borderStyle = UITextBorderStyleRoundedRect;
		passwordField2.placeholder = @"Retype Password";
		passwordField2.secureTextEntry = YES;
		[passwordField2 addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[passwordField2 addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		//[passwordField setText:@"h"];
		[self addSubview:passwordField2];
		
		sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[sendButton setFrame:CGRectMake(85, 360, 150, 30)];
		[sendButton setTitle:@"Send" forState:UIControlStateNormal];
		[sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[sendButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[sendButton addTarget:self action:@selector(sendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:sendButton];
		
		textLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(35,410, 250, 30)];
		textLabel2.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel2 setText:@"Your Username and Email Address will be public"];
		[self addSubview:textLabel2];
		[textLabel2 release];
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
	[delegate actionButton:self command:@"goRegister" message:@"Versuchen zu registrieren"];
}


- (void)dealloc {
	[usernameField release];
	[emailField release];
	[passwordField release];
	[passwordField2 release];
	[sendButton release];
    [super dealloc];
}


@end
