    //
//  MainNavigationController.m
//  TUGuide
//
//  Created by Ivo Galic on 11/30/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "MainNavigationController.h"


@implementation MainNavigationController


@synthesize loginViewController;
@synthesize registerLoginViewController;
@synthesize registerViewController;
@synthesize delegate2;

-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg{
	// change 
	NSLog(@"MainNavigationController: switching to controller %@", cmd);
	[self switchToController:cmd animated:YES];
	[delegate2 passing:self command:cmd message:msg];// send to father 
}


-(void)switchToController:(NSString *)controller animated:(BOOL)animated{
	
	// check if not null then initialize
	if ([controller isEqual:@"Register"]) {
		[self pushViewController:registerViewController animated:animated];
		self.registerViewController.title = @"Register";
	}
	
	if ([controller isEqual:@"Login"]) {
		[self pushViewController:loginViewController animated:animated];
		self.loginViewController.title = @"Login";
	}
	
	[self setNavigationBarHidden:NO];
	
	
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	loginViewController = [[LoginViewController alloc]init];
	registerLoginViewController = [[RegisterLoginViewController alloc]init];
	registerViewController = [[RegisterViewController alloc] init];
	
	
	//[self pushViewController:loginViewController animated:YES];
    registerLoginViewController.delegate = self;
	loginViewController.delegate = self;
	registerViewController.delegate = self;
	[self pushViewController:registerLoginViewController animated:YES];
    [super viewDidLoad];
	
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


- (void)dealloc {
	[registerLoginViewController release];
	[loginViewController release];
    [super dealloc];
}


@end
