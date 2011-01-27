//
//  iMisseditDetailViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 20.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "IMisseditDetailViewController.h"


@implementation IMisseditDetailViewController

@synthesize announcement, detailView, me, serverConnection, event, identifier, newAnnouncement, announcements;

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
	serverConnection.delegate2 = self;
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
	UIBarButtonItem * add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAnnouncement:)];
	self.navigationItem.rightBarButtonItem = add;
	
	self.view = detailView;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.detailView.header.lineBreakMode = UILineBreakModeWordWrap;
	self.detailView.header.numberOfLines = 0;
	[self.detailView.header setText:self.event.title];
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

-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg{
	if ([cmd isEqual:@"iMissedItDataRecieved"]) {
		NSLog(@"data received");
		announcements = [[NSMutableArray alloc]initWithArray:serverConnection.annoucements];
		[self.detailView.contentTable reloadData];
		return YES; 
	}
	
	if ([cmd isEqual:@"iMissedItDataFailed"]) {
		NSLog(@"data not received");
		return NO;
	}
	return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	return [announcements count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 85.0; //returns floating point which will be used for a cell row height at specified row index
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
	cell.textLabel.text = [[announcements objectAtIndex:[indexPath row]] message];
	
	cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.textLabel.numberOfLines = 0;
	cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
	
	cell.detailTextLabel.text = [[announcements objectAtIndex:[indexPath row]] when_announced];	cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.detailTextLabel.numberOfLines = 0;
	cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
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
