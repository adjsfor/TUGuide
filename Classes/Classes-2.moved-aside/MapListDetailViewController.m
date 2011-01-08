    //
//  MapListDetailViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 04.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MapListDetailViewController.h"


@implementation MapListDetailViewController

@synthesize detailView;


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	detailView = [[MapListDetailView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = detailView;
	
	self.view.userInteractionEnabled = YES;
}



- (void)viewDidLoad {
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
    [super dealloc];
}


@end
