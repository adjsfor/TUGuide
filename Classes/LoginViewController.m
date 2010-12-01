    //
//  LoginViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 26.11.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "LoginViewController.h"


@implementation LoginViewController

@synthesize registerLoginView;
@synthesize registerView;
@synthesize loginView;
@synthesize scrollView;
@synthesize activeField;
@synthesize wizard;
@synthesize delegate;


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	loginView = [[LoginView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = loginView;
	self.loginView.delegate = self;
	//wizard = [[Wizard alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	//self.view = wizard;
	
	self.view.userInteractionEnabled = YES;
	
	/*
	loginView = [[LoginView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	scrollView = [[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = scrollView;
	[scrollView addSubview:loginView];
	 */
	/*
	registerView = [[RegisterView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = registerView;
	*/
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWillShow:(NSNotification*)aNotification
{
	/*
	 ServerLogin *server = [[ServerLogin alloc] init];
	 [server testConnection];
	 */
	
    NSDictionary* info = [aNotification userInfo];
	
	// get the size of the keyboard
    NSValue* boundsValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [boundsValue CGRectValue].size;
	
	
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardSize.height;
    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
	 CGPoint scrollPoint = CGPointMake(0.0, activeField.frame.origin.y-keyboardSize.height);
	 [scrollView setContentOffset:scrollPoint animated:YES];
	 }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillHide:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
	keyboardIsShown = NO;
	[activeField resignFirstResponder];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(keyboardWillShow:) 
												 name:UIKeyboardWillShowNotification 
											   object:self.view.window];
	// register for keyboard notifications
	[[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(keyboardWillHide:) 
												 name:UIKeyboardWillHideNotification 
											   object:self.view.window];
    keyboardIsShown = NO;
	//make contentSize bigger than your scrollSize (you will need to figure out for your own use case)
    CGSize scrollContentSize = CGSizeMake(320, 430);
    self.scrollView.contentSize = scrollContentSize;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)actionButton:(UIView *)requestor command:(NSString *)cmd message:(NSString *)msg{
	if ([cmd isEqual:@"enterTextField"]) {
		 CGPoint scrollPoint = CGPointMake(0.0, 150.0);
		 [self.loginView setContentOffset:scrollPoint animated:YES];
	}else if ([cmd isEqual:@"exitTextField"]) {
		[self.loginView.emailField resignFirstResponder];
		[self.loginView.passwordField resignFirstResponder];
		CGPoint scrollPoint = CGPointMake(0.0f, 0.0f);
		[self.loginView setContentOffset:scrollPoint animated:YES];
	}else {
		[delegate passTo:self command:cmd message:msg];
	}
}


- (void)dealloc {
    [super dealloc];
}


@end
