    //
//  LecturesDetailViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "LecturesDetailViewController.h"


@implementation LecturesDetailViewController
@synthesize detailView,delegate2,classrooms;

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
//- (void)loadView {
//	detailView = [[LecturesDetailView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//	self.view = detailView;
//	
//	self.view.userInteractionEnabled = YES;
//}


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

- (LecturesDetailViewController *)initWithClassrooms:(NSMutableArray*)classes{
	self = [super init];
	if (self) {
		self.classrooms = classes;
	}
	return self;
}

- (void)viewDidLoad{

	XLog("pre");
	//self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];	
	//self.allowsEditing = YES;
//	UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithTitle:@"Add" 
//															 style:UIBarButtonItemStyleBordered 
//															target:self action:@selector(addTodo:)];
//	self.navigationItem.rightBarButtonItem = btn;
	Classroom *c = [LecturesCalendarHelper searchClassroomByName:self.classrooms name:[self.event location]];
	
	XLog("Classroom %@",c);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewWillDisappear:(BOOL)animated{
	[delegate2 passTo:self command:@"goDeselect" message:@"back"];
	[super viewWillDisappear:animated];
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
