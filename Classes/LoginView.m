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
@synthesize user;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		
		self.backgroundColor = [UIColor whiteColor];
		
		UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
		bigLogo = [[UIImageView alloc] initWithFrame:CGRectMake(30,20, 260, 260)];
		bigLogo.image = img;
		[img release];
		[self addSubview:bigLogo];
		
		textLabel = [[UILabel alloc]initWithFrame:CGRectMake(55,280, 220, 30)];
		textLabel.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel setText:@"Please login to use the services of TUGuide"];
		[self addSubview:textLabel];
		
		emailField =[[UITextField alloc]initWithFrame:CGRectMake(20, 310, 280, 30)];
		emailField.borderStyle = UITextBorderStyleRoundedRect;
		emailField.placeholder = @"email";
		emailField.text = @"martinlangeder@gmail.com";
		[self addSubview:emailField];
		
		passwordField =[[UITextField alloc]initWithFrame:CGRectMake(20, 345, 280, 30)];
		passwordField.borderStyle = UITextBorderStyleRoundedRect;
		passwordField.placeholder = @"password";
		passwordField.text =@"martin";
		passwordField.secureTextEntry = YES;
		[self addSubview:passwordField];
		
		sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[sendButton setFrame:CGRectMake(85, 430, 150, 30)];
		[sendButton setTitle:@"Send" forState:UIControlStateNormal];
		[sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[sendButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[sendButton addTarget:self action:@selector(sendButtonAction:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:sendButton];
		
		textLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(70,380, 150, 30)];
		textLabel2.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel2 setText:@"Save Login Data"];
		[self addSubview:textLabel2];
		
		saveLogin = [[UISwitch alloc]initWithFrame:CGRectMake(170, 380, 30, 30)];
		[self addSubview:saveLogin];
    }
    return self;
}

-(IBAction)sendButtonAction:(id)sender{
	
	user = [[User alloc]initWithEmailAndPassword:[emailField text] password:[passwordField text]];
	
	if (saveLogin.isOn) {
		NSLog(@"savelogin");
		NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
		[prefs setValue:[user email] forKey:@"name_preference"];
		[prefs setValue:[user password] forKey:@"password_preference"];

		NSString *strUserName = [prefs stringForKey:@"name_preference"];
		NSLog(strUserName);
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
	[sendButton release];
	[bigLogo release];
	[emailField release];
	[passwordField release];
	[textLabel release];
	[user release];
    [super dealloc];
	
}


@end
