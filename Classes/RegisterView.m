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
@synthesize keyboardHight;
@synthesize backButton;
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
		self.userInteractionEnabled = YES;
		
		UIImage *img = [UIImage imageNamed: @"TUGuideLogo.png"];
		bigLogo = [[UIImageView alloc] initWithFrame:CGRectMake(85,30, 150, 150)];
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
		
		textLabel = [[UILabel alloc]initWithFrame:CGRectMake(55,185, 220, 30)];
		textLabel.font = [UIFont fontWithName:@"Helvetica" size:11];  
		[textLabel setText:@"Register for the Services of TUGuide"];
		[self addSubview:textLabel];
		
		usernameField =[[UITextField alloc]initWithFrame:CGRectMake(20, 225, 280, 30)];
		usernameField.borderStyle = UITextBorderStyleRoundedRect;
		[usernameField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[usernameField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		usernameField.placeholder = @"Username";
		[self addSubview:usernameField];
		
		emailField =[[UITextField alloc]initWithFrame:CGRectMake(20, 265, 280, 30)];
		emailField.borderStyle = UITextBorderStyleRoundedRect;
		emailField.placeholder = @"ends with @*tuwien.ac.at";
		[emailField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[emailField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		[self addSubview:emailField];
		
		passwordField =[[UITextField alloc]initWithFrame:CGRectMake(20, 305, 280, 30)];
		passwordField.borderStyle = UITextBorderStyleRoundedRect;
		passwordField.placeholder = @"Password";
		passwordField.secureTextEntry = YES;
		[passwordField addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[passwordField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		[self addSubview:passwordField];
		
		passwordField2 =[[UITextField alloc]initWithFrame:CGRectMake(20, 345, 280, 30)];
		passwordField2.borderStyle = UITextBorderStyleRoundedRect;
		passwordField2.placeholder = @"Retype Password";
		[passwordField2 addTarget:self action:@selector(enterTextField:) forControlEvents:UIControlEventEditingDidBegin];
		[passwordField2 addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		passwordField2.secureTextEntry = YES;
		//[passwordField setText:@"h"];
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
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(setKeybordHight:) 
												 name:UIKeyboardWillShowNotification 
											   object:self.window];
    return self;
	
}


- (IBAction)sendButtonAction:(id)sender{
	
	if ([[passwordField text]isEqualToString:[passwordField2 text]]) {
		user = [[User alloc] initWithArguments:[emailField text] withPassword:[passwordField text] withScreenName:[usernameField text]];
		
		[self setFrame:CGRectMake( 0.0f, 0.0f, 320.0f, 480.0f)]; //notice this is OFF screen!
		[UIView beginAnimations:@"animatedLoginView" context:nil];
		[UIView setAnimationDuration:0.5];
		[self setFrame:CGRectMake( 320.0f, 0.0f, 320.0f, 480.0f)]; //notice this is ON screen!
		[UIView commitAnimations];
		
	}else {
		UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Passwords need to match!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
		[someError show];
		[someError release];
		//[passwordField setText:@"t"];
		//[passwordField2 setText:@"t"];
	}
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

- (IBAction)backButtonPressed:(id)sender{
	
	[self setFrame:CGRectMake( 0.0f, 0.0f, 320.0f, 480.0f)];
	[UIView beginAnimations:@"animatedLoginView" context:nil];
	[UIView setAnimationDuration:0.5];
	[self setFrame:CGRectMake( 320.0f, 0.0f, 320.0f, 480.0f)];
	[UIView commitAnimations];
	[usernameField resignFirstResponder];
	[emailField resignFirstResponder];
	[passwordField resignFirstResponder];
	[passwordField2 resignFirstResponder];
	//self.dealloc;
}

- (void)setKeybordHight:(NSNotification*)aNotification
{
	NSDictionary* info = [aNotification userInfo];
	CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    keyboardHight = kbSize.height;
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
