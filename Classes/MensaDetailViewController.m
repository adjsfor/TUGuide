    //
//  MensaDetailViewController.m
//  TUGuide
//
//  Created by Martin Langeder on 12.01.11.
//  Copyright 2011 7359. All rights reserved.
//

#import "MensaDetailViewController.h"


@implementation MensaDetailViewController

@synthesize mensa, detailView;

-(id)initWithMensa:(Mensa *) m
{
	self = [super init];
	self.mensa = m;
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
	detailView = [[MensaDetailView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
	detailView.contentTable.dataSource = self;
	detailView.contentTable.delegate = self;
	self.view = detailView;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.detailView.header.lineBreakMode = UILineBreakModeWordWrap;
	self.detailView.header.numberOfLines = 0;
	[self.detailView.header setText:mensa.name];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	return [mensa.mensaMenus count];
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
	
	//MensaMenu *m = [mensa.mensaMenus objectAtIndex:[indexPath row]];
	//[cell setMenu:m];

	cell.textLabel.text = [[mensa.mensaMenus objectAtIndex:[indexPath row]] name];
	cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.textLabel.numberOfLines = 0;
	cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
	cell.textLabel.textColor = [UIColor colorWithRed:.99 green:.65 blue:.11 alpha:1];
	
	cell.detailTextLabel.text = [[mensa.mensaMenus objectAtIndex:[indexPath row]] content];
	cell.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.detailTextLabel.numberOfLines = 0;
	cell.detailTextLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
	cell.detailTextLabel.textColor = [UIColor colorWithRed:.43 green:.43 blue:.43 alpha:1];
    
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
