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
@synthesize user;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
		
		self.backgroundColor = [UIColor whiteColor];
		self.userInteractionEnabled = YES;
		
		UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
		bigLogo = [[UIImageView alloc] initWithFrame:CGRectMake(30,20, 260, 260)];
		bigLogo.image = img;
		[img release];
		[self addSubview:bigLogo];
		
		backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[backButton setFrame:CGRectMake(1, 21, 20, 20)];
		[backButton setTitle:@"<" forState:UIControlStateNormal];
		[backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[backButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:backButton];
		
		textLabel = [[UILabel alloc]initWithFrame:CGRectMake(55,280, 220, 30)];
		textLabel.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel setText:@"Please login to use the services of TUGuide"];
		[self addSubview:textLabel];
		
		emailField =[[UITextField alloc]initWithFrame:CGRectMake(20, 310, 280, 30)];
		emailField.borderStyle = UITextBorderStyleRoundedRect;
		emailField.placeholder = @"email";
		[emailField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[emailField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		[emailField addTarget:self action:@selector(userDoneEnteringText:) forControlEvents:UIControlEventTouchUpOutside];
		//emailField.text = @"martinlangeder@gmail.com";
		[self addSubview:emailField];
		
		passwordField =[[UITextField alloc]initWithFrame:CGRectMake(20, 345, 280, 30)];
		passwordField.borderStyle = UITextBorderStyleRoundedRect;
		passwordField.placeholder = @"password";
		[passwordField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[passwordField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		//passwordField.text =@"martin";
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
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(setKeybordHight:) 
												 name:UIKeyboardWillShowNotification 
											   object:self.window];
    return self;
}

- (IBAction)exitTextField:(UITextField *)sender{
	[sender resignFirstResponder];
	CGPoint scrollPoint = CGPointMake(0.0f, 0.0f);
	[self setContentOffset:scrollPoint animated:YES];
}

- (IBAction)enterTextField:(UITextField *)sender{
	// get the size of the keyboard
	int keybordSize = keyboardHight;
	if(!keybordSize) keybordSize=216;
	
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.frame;
    aRect.size.height -= keybordSize;
    if (!CGRectContainsPoint(aRect, sender.frame.origin) ) {
		CGPoint scrollPoint = CGPointMake(0.0, sender.frame.origin.y-keybordSize);
		[self setContentOffset:scrollPoint animated:YES];
	}
}

-(IBAction)sendButtonAction:(id)sender{
	
	user = [[User alloc]initWithArguments:[emailField text] withPassword:[passwordField text] withScreenName:nil];
	
	if (saveLogin.isOn) {
		NSLog(@"savelogin");
		NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
		[prefs setValue:[user email] forKey:@"name_preference"];
		[prefs setValue:[user password] forKey:@"password_preference"];

		NSString *strUserName = [prefs stringForKey:@"name_preference"];
		NSLog(@"Username :%s", strUserName);
	}
}

- (IBAction)backButtonPressed:(id)sender{
	
	[self setFrame:CGRectMake( 0.0f, 0.0f, 320.0f, 480.0f)];
	[UIView beginAnimations:@"animatedLoginView" context:nil];
	[UIView setAnimationDuration:0.5];
	[self setFrame:CGRectMake( 0.0f, 480.0f, 320.0f, 480.0f)];
	[UIView commitAnimations];
	[emailField resignFirstResponder];
	[passwordField resignFirstResponder];
	//self.dealloc;
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
	[user release];
    [super dealloc];
	
}


@end
