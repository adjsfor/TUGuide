//
//  LocationDetailViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 10.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "LocationDetailViewController.h"


@implementation LocationDetailViewController

@synthesize c;

-(id)initWithClassroom:(Classroom *)classr
{
	//c = [[Classroom alloc] init];
	c = classr;
	return self;
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


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	
	UIWebView *locationPdf = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 370.0)];
	[locationPdf setScalesPageToFit:YES];

	NSURL *targetURL = [NSURL URLWithString:@""];
	if ([c.pdf_link_cms isEqualToString:@""]) {
		targetURL = [NSURL URLWithString:c.pdf_link_wegweiser];
	}else{
		targetURL = [NSURL URLWithString:c.pdf_link_wegweiser];
	}
	NSLog(@"%@",c.pdf_link_cms);
	NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
	[locationPdf loadRequest:request];
	
	[self.view addSubview:locationPdf];
	[locationPdf release];
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
