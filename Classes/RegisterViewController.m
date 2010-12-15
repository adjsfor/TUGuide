    //
//  RegisterViewController.m
//  TUGuide
//
//  Created by Ivo Galic on 11/30/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "RegisterViewController.h"


@implementation RegisterViewController

@synthesize registerView;
@synthesize delegate;
@synthesize user;
@synthesize server;


// RegisterLoginView delegation
-(void)actionButton:(UIView *)requestor command:(NSString *)cmd message:(NSString *)msg{
	/*
	 
	 */
	if ([cmd isEqual:@"enterTextField"]) {
		CGPoint scrollPoint = CGPointMake(0.0, 190.0);
		[[self registerView] setContentOffset:scrollPoint animated:YES];
	}else if ([cmd isEqual:@"exitTextField"]) {
		[[[self registerView] passwordField] resignFirstResponder];
		[[[self registerView] emailField] resignFirstResponder];
		[[[self registerView] passwordField2] resignFirstResponder];
		[[[self registerView] usernameField] resignFirstResponder];
		CGPoint scrollPoint = CGPointMake(0.0f, 0.0f);
		[self.registerView setContentOffset:scrollPoint animated:YES];
	}else {
		[delegate passTo:self command:cmd message:msg]; // pass to up
	}
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	self.title =@"TuGuide Start";
	registerView = [[RegisterView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = registerView;
	
	[self.navigationController setNavigationBarHidden:YES];
	self.registerView.delegate = self; // set the delegation
	
	self.view.userInteractionEnabled = YES;
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize scrollContentSize = CGSizeMake(320, 430);
    self.registerView.contentSize = scrollContentSize;
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


@end
