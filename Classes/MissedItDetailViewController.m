//
//  MissedItDetailViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 08.02.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MissedItDetailViewController.h"


@implementation MissedItDetailViewController

@synthesize announcement, me, serverConnection, event, identifier, newAnnouncement, announcements;

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
	UIBarButtonItem * add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAnnouncement:)];
	self.navigationItem.rightBarButtonItem = add;
	
	[self.navigationController setTitle:self.event.title];
	return self;
}

#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	UIBarButtonItem * add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAnnouncement:)];
	self.navigationItem.rightBarButtonItem = add;
	
	[self.navigationItem setTitle:self.event.title];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
		[self.tableView reloadData];
		return YES; 
	}
	
	if ([cmd isEqual:@"iMissedItDataFailed"]) {
		NSLog(@"data not received");
		return NO;
	}
	if ([cmd isEqual:@"iMissedItDataSend"]) {
		NSLog(@"data send");
		[serverConnection getDataForScreen_name:me.screenName andLectureId:identifier andSessionId:me.sessionId];
		return YES;
	}
	return YES;
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

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
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

