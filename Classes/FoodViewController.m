//
//  FoodViewController.m
//  TUGuide
//
//  Created by Ivo Galic on 1/8/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

/*
#import "FoodViewController.h"


@implementation FoodViewController

@synthesize segmentedController,stubViewController,delegate2;





-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg{
	//NSLog(@"OrganizerNavigationController: switching to controller %@", cmd);
}


-(void) segmentAction: (UISegmentedControl *) sender
{
	[delegate2 passing:self command:@"change food controller" message:@"some message"];
	
	switch (sender.selectedSegmentIndex) {
		case 0:
			XLog(@"Switch to mensa" );	
			self.view = stubViewController.view;
			break;
		case 1:
			XLog(@"Switch to restaurants" );	
			self.view = stubViewController.view;
			break;
		default:
			break;
	}
}



NSArray *allSubviewsFood(UIView *aView)
{
	NSArray *results = [aView subviews];
	for (UIView *eachView in [aView subviews])
	{
		NSArray *riz = allSubviews(eachView);
		if (riz) results = [results arrayByAddingObjectsFromArray:riz];
	}
	return results;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	
	// create for segmented control
	stubViewController = [[StubViewController alloc] init];
	
	
	self.view = stubViewController.view;
	
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	
	// Create the segmented control. Choose one of the three styles
	NSArray *buttonNames = [NSArray arrayWithObjects:@"Mensa", @"Restaurant", nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:buttonNames];
	segmentedControl.segmentedControlStyle = UIBarStyleBlackTranslucent; 
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	segmentedControl.frame = CGRectMake(0, 0, 290, 32);
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	
	// For menus, the momentary behavior is preferred. Otherwise, the segmented control
	// provides a radio-button style interface
	segmentedControl.momentary = NO;
	segmentedControl.selectedSegmentIndex = 0;
	
	CFShow(allSubviewsFood(segmentedControl));
	
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedControl;
	[segmentedControl release];
	
	
}


- (id)init {
	
	if (self = [super initWithNibName:@"Food" bundle:nil]) {
		self.title = @"Food";
		UIImage* anImage = [UIImage imageNamed:@"48-fork-and-knife.png"];
		UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Food" image:anImage tag:0];
		self.tabBarItem = theItem;
		[theItem release];
	}
	
	return self;
	
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
 }*/

/*
 

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
*/
