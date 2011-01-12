//
//  TodoDetailViewController.m
//  TUGuide
//
//  Created by Ivo Galic on 1/11/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "TodoDetailViewController.h"


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
		todoText.backgroundColor = [UIColor whiteColor];
		todoText.text = @"New task";
		
		
		todoStatus = [[UILabel alloc] initWithFrame:CGRectMake(65.0, 83, 77, 32.0)];
		todoStatus.font = [UIFont fontWithName:@"Arial" size:14];
		[self.todoStatus setText:@"In Progress"];
		
		statusShow = [[UILabel alloc] initWithFrame:CGRectMake(15, 83, 50, 32.0)];
		statusShow.text = @"Status:";
		statusShow.font = [UIFont fontWithName:@"Arial" size:11];
		
		todoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[todoButton setFrame:CGRectMake(147, 83, 160, 32)];
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
		todoPriority.frame = CGRectMake(105, 122, 200, 32);
		todoPriority.selectedSegmentIndex = 0;
		[todoPriority addTarget:self action:@selector(updatePriority:) forControlEvents:UIControlEventValueChanged];
		
		priorityShow = [[UILabel alloc] initWithFrame:CGRectMake(15, 122, 70, 32.0)];
		priorityShow.text = @"Priority";
		priorityShow.font = [UIFont fontWithName:@"Arial" size:12];
		
		
		saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[saveButton setFrame:CGRectMake(15, 160, 290, 32)];
		[saveButton setTitle:@"Save" forState:UIControlStateNormal];
		[saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[saveButton setBackgroundImage:[UIImage imageNamed: @"ButtonDark.png"] forState:UIControlStateNormal];
		[saveButton addTarget:self action:@selector(leanBack:) forControlEvents:UIControlEventTouchUpInside];
		
		
		
		[contentView addSubview:todoText];
		[contentView addSubview:todoPriority];
		[contentView addSubview:todoStatus];
		[contentView addSubview:todoButton];
		[contentView addSubview:statusShow];
		[contentView addSubview:priorityShow];
		[contentView addSubview:saveButton];
		
		
		self.view = contentView;
	}
	return self;
}

- (void) updateStatus:(id) sender {
	if(self.todo.status == 0) {
		[self.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateNormal];
		[self.todoButton setTitle:@"Mark As In Progress" forState:UIControlStateHighlighted];
		[self.todoStatus setText:@"Complete"];
		[self.todo updateStatus:1];
	} else {
		[self.todoButton setTitle:@"Mark As Complete" forState:UIControlStateNormal];
		[self.todoButton setTitle:@"Mark As Complete" forState:UIControlStateHighlighted];
		[self.todoStatus setText:@"In Progress"];
		[self.todo updateStatus:0];
	}
}



- (void) updatePriority:(id)sender {
	int priority = [self.todoPriority selectedSegmentIndex];
	[self.todo updatePriority:(2-priority+1)];
}

- (void) updateText:(id) sender {
	self.todo.text = self.todoText.text;
}

- (void) viewWillDisappear:(BOOL)animated{
	[self updateStatus:self];
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
