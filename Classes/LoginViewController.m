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



-(void)actionButton:(UIView *)requestor command:(NSString *)cmd message:(NSString *)msg{
	/*
	 
	 */
	if ([cmd isEqual:@"enterTextField"]) {
		CGPoint scrollPoint = CGPointMake(0.0, 210.0);
		[self.loginView setContentOffset:scrollPoint animated:YES];
	}else if ([cmd isEqual:@"exitTextField"]) {
		[self.loginView.emailField resignFirstResponder];
		[self.loginView.passwordField resignFirstResponder];
		CGPoint scrollPoint = CGPointMake(0.0f, 0.0f);
		[self.loginView setContentOffset:scrollPoint animated:YES];
	}else {
		[delegate passTo:self command:cmd message:msg]; // pass to up
	}
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	loginView = [[LoginView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = loginView;
	self.loginView.delegate = self;
	
	self.view.userInteractionEnabled = YES;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize scrollContentSize = CGSizeMake(320, 430);
    self.scrollView.contentSize = scrollContentSize;
}


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

- (void)dealloc {
    [super dealloc];
}


@end
