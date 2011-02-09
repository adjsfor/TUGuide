//
//  TodoDetailViewController.m
//  TUGuide
//
//  Created by Ivo Galic on 1/11/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "TodoDetailViewController.h"

#define TODO_RED_COLOR		[UIColor colorWithRed:1.00f green:0.95f blue:0.96f alpha:5.2f]
#define TODO_YELLOW_COLOR	[UIColor colorWithRed:0.98f green:1.0f blue:0.90f alpha:5.2f]
#define TODO_GREEN_COLOR	[UIColor colorWithRed:0.91f green:1.0f blue:0.92f alpha:5.2f]

@implementation TodoDetailViewController
@synthesize todoText,todoPriority,todoStatus,todoButton,todo,saveButton,priorityShow,statusShow,delegate;

- (id)init{
	self = [super init];
	if (self) {
		UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
		
		contentView.backgroundColor = [UIColor whiteColor];
		
		
		todoText= [[UITextView alloc] initWithFrame:CGRectMake(15, 15, 290, 65)];
		todoText.editable = YES;
		todoText.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
		//todoText.backgroundColor = [UIColor whiteColor];
		todoText.text = @"New task";
		[todoText becomeFirstResponder];
		
		todoStatus = [[UILabel alloc] initWithFrame:CGRectMake(65.0, 83, 77, 32.0)];
		todoStatus.font = [UIFont fontWithName:@"Arial" size:14];
		[self.todoStatus setText:@"In Progress"];
		
		statusShow = [[UILabel alloc] initWithFrame:CGRectMake(15, 122, 70, 32.0)];
		statusShow.text = @"Status";
		statusShow.font = [UIFont fontWithName:@"Arial" size:18];
		
		todoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[todoButton setFrame:CGRectMake(105, 122, 200, 32)];
		[todoButton setTitle:@"State" forState:UIControlStateNormal];
		[todoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[todoButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[todoButton addTarget:self action:@selector(updateStatus:) forControlEvents:UIControlEventTouchUpInside];
		[todoButton setTitle:@"Mark As Complete" forState:UIControlStateNormal];
		//[self addSubview:sendButton];
		
		NSArray *buttonNames = [NSArray arrayWithObjects:@"Low", @"Medium", @"High", nil];
		todoPriority = [[UISegmentedControl alloc] initWithItems:buttonNames];
		todoPriority.segmentedControlStyle = UIBarStyleBlackTranslucent; 
		todoPriority.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		todoPriority.frame = CGRectMake(105, 83, 200, 32);
		//[todoPriority addTarget:self action:@selector(updatePriorityState:) forControlEvents:UIControlEventTouchUpInside];
		todoPriority.selectedSegmentIndex = 0;
		[todoPriority addTarget:self action:@selector(updatePriority:) forControlEvents:UIControlEventValueChanged];
		
		priorityShow = [[UILabel alloc] initWithFrame:CGRectMake(15, 83, 70, 32.0)];
		priorityShow.text = @"Priority";
		priorityShow.font = [UIFont fontWithName:@"Arial" size:18];
		
		
		saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[saveButton setFrame:CGRectMake(105, 161, 200, 32)];
		[saveButton setTitle:@"Save" forState:UIControlStateNormal];
		[saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[saveButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[saveButton addTarget:self action:@selector(leanBack:) forControlEvents:UIControlEventTouchUpInside];
		
		
		
		[contentView addSubview:todoText];
		[contentView addSubview:todoPriority];
		//[contentView addSubview:todoStatus];
		[contentView addSubview:todoButton];
		[contentView addSubview:statusShow];
		[contentView addSubview:priorityShow];
		[contentView addSubview:saveButton];
		
		
		self.view = contentView;
	}
	return self;
}

- (void) updateStatus:(id) sender {
	XLog(" %i ",self.todo.status);
	if(self.todo.status == 0) {
		[self.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateNormal];
		[self.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateHighlighted];
		//[self.todoStatus setText:@"Complete"];
		[self.todo updateStatus:1];
	} else {
		[self.todoButton setTitle:@"Mark As Complete" forState:UIControlStateNormal];
		[self.todoButton setTitle:@"Mark As Complete" forState:UIControlStateHighlighted];
		//[self.todoStatus setText:@"In Progress"];
		[self.todo updateStatus:0];
	}
}


- (void) updatePriority:(id)sender {
	int priority = [self.todoPriority selectedSegmentIndex];
	int i = [self.todoPriority selectedSegmentIndex];
	switch (i) {
		case 0:
			[self.todoText setBackgroundColor:TODO_GREEN_COLOR];
			[self.view setBackgroundColor:TODO_GREEN_COLOR];
			[self.statusShow setBackgroundColor:TODO_GREEN_COLOR];
			[self.priorityShow setBackgroundColor:TODO_GREEN_COLOR];
			break;
		case 1:
			[self.todoText setBackgroundColor:TODO_YELLOW_COLOR];
			[self.view setBackgroundColor:TODO_YELLOW_COLOR];
			[self.statusShow setBackgroundColor:TODO_YELLOW_COLOR];
			[self.priorityShow setBackgroundColor:TODO_YELLOW_COLOR];
			break;
		case 2:
			[self.todoText setBackgroundColor:TODO_RED_COLOR];
			[self.view setBackgroundColor:TODO_RED_COLOR];
			[self.statusShow setBackgroundColor:TODO_RED_COLOR];
			[self.priorityShow setBackgroundColor:TODO_RED_COLOR];
			break;
		default:
			break;
	}
	[self.todo updatePriority:(2-priority+1)];
}

- (void) updateText:(id) sender {
	self.todo.text = self.todoText.text;
}

- (void) viewWillDisappear:(BOOL)animated{
	//[self updateStatus:self];
	[self updatePriority:self];
	[self updateText:self];
	[todo dehydrate]; // update the data in database
	[super viewWillDisappear:animated];
}

-(void)leanBack:(id) sender {
	[delegate passTo:self command:@"finishedEditTodo" message:@"finishedEditTodo"];
}

// Implement loadView if you want to create a view hierarchy programmatically
// - (void)loadView {
//	 // load view
//
// }
 

/*
 If you need to do additional setup after loading the view, override viewDidLoad.
 - (void)viewDidLoad {
 }
 */


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[todoText release];
	[todoPriority release];
	[todoStatus release];
	[todoButton release];
	[super dealloc];

}


@end
