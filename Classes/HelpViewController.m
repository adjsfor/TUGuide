    //
//  HelpViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 20.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "HelpViewController.h"


@implementation HelpViewController 
@synthesize scrollView, imageView;

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
	
	UIWebView *helpView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 370.0)];
	//[helpView setScalesPageToFit:YES];
	[helpView scalesPageToFit];
	
	NSURL *targetURL;
	targetURL = [NSURL URLWithString:@"http://hgmm.webhop.net:56789/help/wizard.jpg"];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
	[helpView loadRequest:request];
	
	[self.view addSubview:helpView];
	[helpView release];
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
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

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
	return imageView;
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
	[imageView release];
	[scrollView release];
}


@end
