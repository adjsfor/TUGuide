//
//  RegisterLoginViewController.m
//  TUGuide
//
//  Created by Ivo Galic on 11/30/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "RegisterLoginViewController.h"


@implementation RegisterLoginViewController

@synthesize registerLoginView;
@synthesize registerView;
@synthesize loginView;
@synthesize scrollView;
@synthesize activeField;
@synthesize wizard;
@synthesize delegate;


// RegisterLoginView delegation
-(void)actionButton:(UIView *)requestor command:(NSString *)cmd message:(NSString *)msg; 
{
	NSLog(@"RegisterLoginViewController: actionButton %@  %@  %@", requestor,cmd,msg);
	[delegate passTo:self command:cmd message:msg]; //say to mainna
}




// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	self.title =@"TuGuide Start";
	registerLoginView = [[RegisterLoginView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = registerLoginView;
	
	[self.navigationController setNavigationBarHidden:NO];
	self.registerLoginView.delegate = self; // set the delegation
	
	//wizard = [[Wizard alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	//self.view = wizard;
	
	self.view.userInteractionEnabled = YES;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	//make contentSize bigger than your scrollSize (you will need to figure out for your own use case)
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
