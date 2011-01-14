//
//  MapListDetailViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 07.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MapListDetailViewController.h"


@implementation MapListDetailViewController

@synthesize detailView, c;

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

-(id)initWithClassroom:(Classroom *)classr
{
	//c = [[Classroom alloc]init];
	c = classr;
	return self;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	detailView = [[MapListDetailView alloc] initWithFrame:[[UIScreen mainScreen] bounds] andClassroom:c];
	[detailView.showLocationButton addTarget:self action:@selector(showLocationPdf:) forControlEvents:UIControlEventTouchUpInside];
	self.view = detailView;
}

- (void)showLocationPdf:(id)sender
{
	[self.navigationController pushViewController:[[LocationDetailViewController alloc] initWithClassroom:c] animated:YES];
}


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
