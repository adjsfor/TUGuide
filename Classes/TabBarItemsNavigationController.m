    //
//  TabBarItemsNavigationController.m
//  TUGuide
//
//  Created by Ivo Galic on 12/31/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import "TabBarItemsNavigationController.h"


@implementation TabBarItemsNavigationController

@synthesize tabObjectViewController,delegate2;

-(void)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg{
	XLog(@" %@", cmd);
	[delegate2 passing:self command:cmd message:msg];// send to father 
}


- (id)initWithRootViewControllerAndAddDelegate:(TabObjectViewController *)rootViewController{
	//tabObjectViewController = rootViewController;
	return [self initWithRootViewController:rootViewController];
	//rootViewController.delegate2 = self;
	
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

/*

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
    [super dealloc];
}


@end
