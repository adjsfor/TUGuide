    //
//  iMisseditDetailViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 20.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "IMisseditDetailViewController.h"


@implementation IMisseditDetailViewController

@synthesize announcement, detailView;

-(id)initWithAnnouncements:(Announcement *) a
{
	self = [super init];
	self.announcement = a;
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
	detailView = [[IMisseditDetailView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	detailView.contentTable.dataSource = self;
	detailView.contentTable.delegate = self;
	self.view = detailView;
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
