    //
//  iMisseditDetailViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 20.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "IMisseditDetailViewController.h"


@implementation IMisseditDetailViewController

@synthesize announcement, detailView, me, serverConnection, event, identifier, newAnnouncement;

-(id)initWithEvent:(EKEvent *) e andUser:(User *)u
{
	self = [super init];
	self.me = u;
	self.event = e;
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateStyle:NSDateFormatterShortStyle];
	[dateFormat setTimeStyle:NSDateFormatterShortStyle];
	identifier = [[NSMutableString alloc]init];
	[identifier appendString:[dateFormat stringFromDate:event.startDate]];
	[identifier appendString:event.title];
	serverConnection = [[ServeriMissedIt alloc]init];
	//[serverConnection setDataForScreen_name:me.screenName andLectureId:identifier andSessionId:me.sessionId andMessage:@"erster eintrag"];
	NSLog(@"identifier %@",identifier );
	[serverConnection getDataForScreen_name:me.screenName andLectureId:identifier andSessionId:me.sessionId];
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
	UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAnnouncement:)];
	self.navigationItem.rightBarButtonItem = btn;
	
	self.view = detailView;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.detailView.header.lineBreakMode = UILineBreakModeWordWrap;
	self.detailView.header.numberOfLines = 0;
	[self.detailView.header setText:self.event.title];
	NSMutableArray *announcements = [[NSMutableArray alloc]initWithArray:serverConnection.annoucements];
	
}

-(void)addAnnouncement:(id)sender{
	UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"New Announcement" 
													 message:@"My Message"
													delegate:self cancelButtonTitle:@"Cancel" 
										   otherButtonTitles:@"Add", nil];
	[alert addTextFieldWithValue:@"" label:nil];
	[alert textField].keyboardType = UIKeyboardTypeAlphabet;
	alert.tag = 1;
	[alert show];
	[alert release];
	
}

/*- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (buttonIndex == 0)
	{
		// Yes, do something
	}
	else if (buttonIndex == 1)
	{
	}
}*/

- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(buttonIndex > 0) {
		if(actionSheet.tag == 1) {
			NSString *textValue = [actionSheet textField].text;
			if(textValue==nil)
				return;
			[serverConnection setDataForScreen_name:me.screenName andLectureId:identifier andSessionId:me.sessionId andMessage:textValue];
		}
	}
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
