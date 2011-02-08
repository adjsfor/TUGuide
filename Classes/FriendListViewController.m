//
//  FriendListViewController.m
//  TUGuide
//
//  Created by Jakub Kolesik on 19.01.11.
//  Copyright 2011 TU WIEN. All rights reserved.
//

#import "FriendListViewController.h"


@implementation FriendListViewController


@synthesize friendsArray, friend, classViewController,serverConnection,me,serverCon,selected_temp;

#pragma mark -
#pragma mark Initialization

-(id) initWithUser:(User *)u
{
	self = [super initWithStyle:UITableViewStylePlain];
	//buildingsArray = [[NSMutableArray alloc] init];
	me = u;
	serverConnection = [[ getFriends alloc ]initWithUser:me];
	serverCon = [[ DeleteAddFriend alloc ]init];
	serverConnection.delegate2 = self;
	serverCon.delegate2 = self;
	[serverConnection startProcessing];
	
	return self;
}


-(BOOL)passing:(NSObject *)requestor command:(NSString *)cmd message:(NSString *)msg{
	XLog("%@",cmd);
	
	if ([cmd isEqual:@"finished"]) {
		friendsArray = [serverConnection friends];
		[self.tableView reloadData];
	}
	if ([cmd isEqual:@"friendDeleted"]) {
		XLog("%@",cmd);
		[serverConnection startProcessing];
	}	
	
	if ([cmd isEqual:@"friendAdded"]) {
		XLog("%@",cmd);
		[serverConnection startProcessing];
	}
	return YES;
}

#pragma mark -
#pragma mark View lifecycle


- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if(buttonIndex > 0) {
		XLog("%i",buttonIndex);
		if (add_del == 0) {
			XLog("DELETING %i",buttonIndex);
			[serverCon deleteFriendforMyScreenName:me.screenName andSessionId:me.sessionId andFriendScreenName:selected_temp];
		}else if (add_del == 1) {
			NSString *textValue = [actionSheet textField].text;
			if(textValue==nil)
				return;
			XLog("Adding %@",textValue);
			[serverCon addFriendforMyScreenName:me.screenName andSessionId:me.sessionId andFriendScreenName:textValue];
		}else{
			XLog("ERROR %i",buttonIndex);
		}

			
	}
}

-(void)addFriend:(id)sender{
	UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"Add new friend the friend?" 
													 message:@""
													delegate:self cancelButtonTitle:@"Cancel" 
										   otherButtonTitles:@"Add", nil];
	add_del = 1;
	[alert addTextFieldWithValue:@"" label:@"friend name"];
	[alert textField].keyboardType = UIKeyboardTypeAlphabet;
	alert.tag = 1;
	[alert show];
	[alert release];
}




- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	
	// Create the segmented control. Choose one of the three styles
	NSArray *segments = [NSArray arrayWithObjects:@"Map", @"Friends", nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:segments];
	segmentedControl.segmentedControlStyle = UIBarStyleBlackTranslucent; 
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	segmentedControl.frame = CGRectMake(0, 0, 290, 32);
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	
	// For menus, the momentary behavior is preferred. Otherwise, the segmented control
	// provides a radio-button style interface
	segmentedControl.selectedSegmentIndex = 1;
	
	//CFShow(allSubviews(segmentedControl));
	
	
	// Add it to the navigation bar
	self.navigationItem.titleView = segmentedControl;
	self.navigationItem.hidesBackButton = YES;
	[segmentedControl release];
	UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend:)];
	self.navigationItem.rightBarButtonItem = btn;
    [super viewDidLoad];
	
}

-(IBAction)segmentAction:(UISegmentedControl *)segmentPick
{
	NSLog(@"segment called %d", segmentPick.selectedSegmentIndex);
	switch (segmentPick.selectedSegmentIndex) {
		case 0:
			[self.navigationController popViewControllerAnimated:NO];
			//[self.navigationController pushViewController:[[MapViewController alloc] init] animated:YES];
			break;
		case 1:
			break;
		default:
			break;
	}
}


 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
	 
 }

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
	return [friendsArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
	if ([friendsArray objectAtIndex:[indexPath row]]!= nil) {
		cell.textLabel.text = [[friendsArray objectAtIndex:[indexPath row]] screen_name ];
		cell.detailTextLabel.text = (NSString *)[[friendsArray objectAtIndex:[indexPath row]] email];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
    
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
	selected_temp = [[friendsArray objectAtIndex:[indexPath row]] screen_name ];
	UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:@"Delete the friend?" 
													 message:[[friendsArray objectAtIndex:[indexPath row]] screen_name ]
													delegate:self cancelButtonTitle:@"Cancel" 
										   otherButtonTitles:@"Delete", nil];
	add_del = 0;
	//®®[alert addTextFieldWithValue:@"" label:nil];
	//[alert textField].keyboardType = UIKeyboardTypeAlphabet;
	alert.tag = 1;
	[alert show];
	[alert release];
    
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cac∫shed data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

