    //
//  OrganizerNavigationController.m
//  TUGuide
//
//  Created by Martin Langeder on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "OrganizerNavigationController.h"


@implementation OrganizerNavigationController

@synthesize segmentedController, lecturesViewController, coursesViewController, todoViewController;

-(void)passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg{
	NSLog(@"OrganizerNavigationController: switching to controller %@", cmd);
	[self switchToController:cmd animated:YES];
}

-(void)switchToController:(NSString *)controller animated:(BOOL)animated{
	
	if ([controller isEqual:@"Lectures"]) {
		lecturesViewController = [[LecturesViewController alloc]initWithStyle:UITableViewStyleGrouped];
		lecturesViewController.delegate =  self;
		[self initWithRootViewController:lecturesViewController];
		[lecturesViewController release];
		//[self presentModalViewController:lecturesViewController animated:YES];
	}
	
	if ([controller isEqual:@"Courses"]) {
		coursesViewController = [[CoursesViewController alloc]initWithStyle:UITableViewStylePlain];
		coursesViewController.delegate = self;
		[self initWithRootViewController:coursesViewController];
		[coursesViewController release];
		//[self presentModalViewController:coursesViewController animated:YES];
	}
	
	if ([controller isEqual:@"ToDo"]) {
		todoViewController = [[ToDoViewController alloc]initWithStyle:UITableViewStylePlain];
		todoViewController.delegate = self;
		[self initWithRootViewController:todoViewController];
		[todoViewController release];
		//[self presentModalViewController:todoViewController animated:YES];
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
	/*lecturesViewController = [[LecturesViewController alloc]initWithStyle:UITableViewStyleGrouped];
	lecturesViewController.delegate =  self;
	
	
	coursesViewController = [[CoursesViewController alloc]init];
	coursesViewController.delegate = self;
	
	todoViewController = [[ToDoViewController alloc]init];
	todoViewController.delegate = self;
	*/
	//[self switchToController:@"Lectures" animated:NO];

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
