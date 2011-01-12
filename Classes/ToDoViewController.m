//
//  ToDoViewController.m
//  TUGuide
//
//  Created by Ivo Galic on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import "ToDoViewController.h"


@implementation ToDoViewController

@synthesize delegate,db,todoView,todoTempDatabase;

- (id)init{
	if (self = [super init]) {
		db = [[TodoDatabase alloc]init];
		[db createEditableCopyOfDatabaseIfNeeded];
		[db initializeDatabase];
		todoView = [[TodoDetailViewController alloc]init];
		todoView.delegate = self;
	}
	return self;
}

- (void)viewDidLoad {
	self.title = @"Todo Items";
	self.navigationItem.leftBarButtonItem = self.editButtonItem;
}



- (void) passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg{
	[delegate passTo:requestor command:cmd message:msg];
}

//- (void) addTodo:(id)sender {
//
//	
//	if(self.todoView == nil) {
//		TodoDetailViewController *viewController = [[TodoDetailViewController alloc] init];
//		self.todoView = viewController;
//		[viewController release];
//	}
//	
//	Todo *todo = [db addTodo];
//	[self.navigationController pushViewController:self.todoView animated:YES];
//	self.todoView.todo = todo;
//	self.todoView.title = todo.text;
//	[self.todoView.todoText setText:todo.text];	
//	
//}

//- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
//    // Updates the appearance of the Edit|Done button as necessary.
//    [super setEditing:editing animated:animated];
//    [self.tableView setEditing:editing animated:YES];
//    // Disable the add button while editing.
//    if (editing) {
//        self.navigationItem.rightBarButtonItem.enabled = NO;
//    } else {
//        self.navigationItem.rightBarButtonItem.enabled = YES;
//    }
//}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return db.todos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *MyIdentifier = @"MyIdentifier";
	
	TodoCell *cell = (TodoCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	if (cell == nil) {
		cell = [[[TodoCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier] autorelease];
		//[emailField addTarget:self action:@selector(exitTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
		
		
	}
	
	Todo *td = [db.todos objectAtIndex:indexPath.row];
	
	[cell setTodo:td];
	
	// Set up the cell
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Todo *todo = (Todo *)[db.todos objectAtIndex:indexPath.row];
	
	if(self.todoView == nil) {
		TodoDetailViewController *viewController = [[TodoDetailViewController alloc] init];
		self.todoView = viewController;
		[viewController release];
	}	


	
	self.todoView.todo = todo;
	self.todoView.title = todo.text;
	self.todoView.todoText.text = todo.text;
	XLog(@"inside2 %@",todo.text);
	
	NSInteger priority = todo.priority - 1;
	if(priority > 2 || priority < 0) {
		priority = 1;
	}
	priority = 2 - priority;
	
	[self.todoView.todoPriority setSelectedSegmentIndex:priority];
	
	if(todo.status == 1) {
		[self.todoView.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateNormal];
		[self.todoView.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateHighlighted];
		[self.todoView.todoStatus setText:@"Complete"];
	} else {
		[self.todoView.todoButton setTitle:@"Mark As Complete" forState:UIControlStateNormal];
		[self.todoView.todoButton setTitle:@"Mark As Complete" forState:UIControlStateHighlighted];
		[self.todoView.todoStatus setText:@"In Progress"];
	}
	[delegate passTo:self command:@"editTodo" message:@"ogog"];
}



// Override if you support editing the list
- (void)tableView:(UITableView *)tableView commitEditingStyle:
(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	Todo *todo = (Todo *)[db.todos objectAtIndex:indexPath.row];
	
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		[db removeTodo:todo];
		// Delete the row from the data source
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
	}	
}



/*
 Override if you support conditional editing of the list
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 Override if you support rearranging the list
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 Override if you support conditional rearranging of the list
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */ 

- (void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
}

- (void)viewDidDisappear:(BOOL)animated {
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[super dealloc];
}


@end
