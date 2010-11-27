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
@synthesize user;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		
		self.backgroundColor = [UIColor whiteColor];
		
		UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
		bigLogo = [[UIImageView alloc] initWithFrame:CGRectMake(85,30, 150, 150)];
		bigLogo.image = img;
		[img release];
		[self addSubview:bigLogo];
		
		textLabel = [[UILabel alloc]initWithFrame:CGRectMake(55,185, 220, 30)];
		textLabel.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel setText:@"Register for the Services of TUGuide"];
		[self addSubview:textLabel];
		
		usernameField =[[UITextField alloc]initWithFrame:CGRectMake(20, 225, 280, 30)];
		usernameField.borderStyle = UITextBorderStyleRoundedRect;
		usernameField.placeholder = @"Username";
		[self addSubview:usernameField];
		
		emailField =[[UITextField alloc]initWithFrame:CGRectMake(20, 265, 280, 30)];
		emailField.borderStyle = UITextBorderStyleRoundedRect;
		emailField.placeholder = @"Email has to end on @*tuwien.ac.at";
		[self addSubview:emailField];
		
		passwordField =[[UITextField alloc]initWithFrame:CGRectMake(20, 305, 280, 30)];
		passwordField.borderStyle = UITextBorderStyleRoundedRect;
		passwordField.placeholder = @"Password";
		[self addSubview:passwordField];
		
		passwordField2 =[[UITextField alloc]initWithFrame:CGRectMake(20, 345, 280, 30)];
		passwordField2.borderStyle = UITextBorderStyleRoundedRect;
		passwordField2.placeholder = @"Retype Password";
		[passwordField setText:@"h"];
		[self addSubview:passwordField2];
		
		sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[sendButton setFrame:CGRectMake(85, 390, 150, 30)];
		[sendButton setTitle:@"Send" forState:UIControlStateNormal];
		[sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[sendButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[sendButton addTarget:self action:@selector(sendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:sendButton];
		
		textLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(35,440, 250, 30)];
		textLabel2.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel2 setText:@"Your Username and Email Address will be public"];
		[self addSubview:textLabel2];
    }
    return self;
	
}

- (IBAction)sendButtonAction:(id)sender{
	
	if ([[passwordField text]isEqualToString:[passwordField2 text]]) {
		user = [[User alloc]initWithEmailPasswordAndUsername:[emailField text] password:[passwordField text] user:[usernameField text]];
		LoginView *loginView = [[LoginView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
		
		[loginView setFrame:CGRectMake( 0.0f, 480.0f, 320.0f, 480.0f)]; //notice this is OFF screen!
		[UIView beginAnimations:@"animatedLoginView" context:nil];
		[UIView setAnimationDuration:0.5];
		[loginView setFrame:CGRectMake( 0.0f, 0.0f, 320.0f, 480.0f)]; //notice this is ON screen!
		[UIView commitAnimations];
		
		[self addSubview:loginView];
	}else {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Passwords need to match!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
		[passwordField setText:@"t"];
		[passwordField2 setText:@"t"];
	}

	
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)dealloc {
	[usernameField release];
	[bigLogo release];
	[emailField release];
	[passwordField release];
	[passwordField2 release];
	[sendButton release];
	[textLabel release];
	[textLabel2 release];
    [super dealloc];
}


@end
