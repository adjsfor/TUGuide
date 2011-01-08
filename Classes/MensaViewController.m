    //
//  MensaViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 08.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MensaViewController.h"


@implementation MensaViewController

@synthesize mensaView;

- (id)init {
	//Initialization of the ViewController and adding TabbarItems and Image
	if (self = [super initWithNibName:nil bundle:nil]) {
		self.title = @"Food";
		UIImage* anImage = [UIImage imageNamed:@"48-fork-and-knife.png"];
		UITabBarItem* theItem = [[UITabBarItem alloc] initWithTitle:@"Food" image:anImage tag:0];
		self.tabBarItem = theItem;
		[theItem release];
	}
	
	return self;
	
}

-(IBAction)segmentAction:(UISegmentedControl *)segmentPick
{
	NSLog(@"segment called %d", segmentPick.selectedSegmentIndex);
	switch (segmentPick.selectedSegmentIndex) {
		case 0:
			//Do nothing because this is the right View and does not need to be changed
			break;
		case 1:
			//Push the RestaurantViewController onto the NavigationStack. The Back Button will be hidden in -loadView
			[self.navigationController pushViewController:[[RestaurantViewController alloc] init] animated:YES];
			break;
		default:
			break;
	}
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
	
	//applying the View to the ViewController
	mensaView = [[MensaView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = mensaView;
	[mensaView release]; 
}
	



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	//Change color of the navigationBar
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	
	// Create the segmented control. Choose one of the three styles
	NSArray *buttonNames = [NSArray arrayWithObjects:@"Mensa", @"Restaurant", nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:buttonNames];
	segmentedControl.segmentedControlStyle = UIBarStyleBlackTranslucent; 
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	segmentedControl.frame = CGRectMake(0, 0, 290, 32);
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.selectedSegmentIndex = 0;
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedControl;
	self.navigationItem.hidesBackButton = YES;
	[segmentedControl release];
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
