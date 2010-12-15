//
//  LoginView.m
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "LoginView.h"


@implementation LoginView

@synthesize keyboardHight;
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
        // Initialization code.
		
		self.backgroundColor = [UIColor whiteColor];
		self.userInteractionEnabled = YES;
		
		UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
		bigLogo = [[UIImageView alloc] initWithFrame:CGRectMake(30,0, 240, 240)];
		bigLogo.image = img;
		[img release];
		[self addSubview:bigLogo];
		
		textLabel = [[UILabel alloc]initWithFrame:CGRectMake(55,240, 220, 30)];
		textLabel.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel setText:@"Please login to use the services of TUGuide"];
		[self addSubview:textLabel];
		
		emailField =[[UITextField alloc]initWithFrame:CGRectMake(20, 260, 280, 30)];
		emailField.borderStyle = UITextBorderStyleRoundedRect;
		emailField.placeholder = @"email";
		[emailField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[emailField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		[emailField addTarget:self action:@selector(userDoneEnteringText:) forControlEvents:UIControlEventTouchUpOutside];
		//emailField.text = @"martinlangeder@gmail.com";
		[self addSubview:emailField];
		
		passwordField =[[UITextField alloc]initWithFrame:CGRectMake(20, 295, 280, 30)];
		passwordField.borderStyle = UITextBorderStyleRoundedRect;
		passwordField.placeholder = @"password";
		[passwordField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[passwordField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		//passwordField.text =@"martin";
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
		
		saveLogin = [[UISwitch alloc]initWithFrame:CGRectMake(170, 330, 30, 30)];
		[self addSubview:saveLogin];
		
		
    }
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(setKeybordHight:) 
												 name:UIKeyboardWillShowNotification 
											   object:self.window];
    return self;
}

- (IBAction)exitTextField:(UITextField *)sender{
	[delegate actionButton:self command:@"exitTextField" message:@"textfiel entered"];
}

- (IBAction)enterTextField:(UITextField *)sender{
	[delegate actionButton:self command:@"enterTextField" message:@"textfiel exited"];
}

-(IBAction)sendButtonAction:(id)sender{
	
	
	if (saveLogin.isOn) {
		NSLog(@"savelogin");
		NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
		[prefs setValue:[emailField text] forKey:@"name_preference"];
		[prefs setValue:[passwordField text] forKey:@"password_preference"];

		NSString *strUserName = [prefs stringForKey:@"name_preference"];
		NSLog(@"Username :%s", strUserName);
	}
	
	//[server loginUser2WithScreen_name:[emailField text] withPassword:[passwordField text]];
	[delegate actionButton:self command:@"goLogin" message:@"Versuchen zu einloggen"];
	 
}

- (void)setKeybordHight:(NSNotification*)aNotification
{
	NSDictionary* info = [aNotification userInfo];
	CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    keyboardHight = kbSize.height;
}


-(IBAction)userDoneEnteringText:(id)sender{
    [emailField resignFirstResponder];
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
    [super dealloc];
	
}


@end
