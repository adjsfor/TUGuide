//
//  TodoDetailViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 1/11/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todo.h"
#import "UIViewControllerDelegate.h"


@interface TodoDetailViewController : UIViewController {
	UITextView        *todoText;
	UISegmentedControl *todoPriority;
	UILabel            *todoStatus;
	UILabel            *statusShow;
	UILabel            *priorityShow;
	UIButton			*todoButton;
	UIButton			*saveButton;
	Todo						*todo;
	id <UIViewControllerDelegate> delegate;
	
}

@property(nonatomic,retain)  UITextView        *todoText;
@property(nonatomic,retain)  UISegmentedControl *todoPriority;
@property(nonatomic,retain)  UILabel            *todoStatus;
@property(nonatomic,retain)  UIButton           *todoButton;
@property(nonatomic,retain)  UIButton           *saveButton;
@property(nonatomic,retain) Todo						*todo;
@property(nonatomic,retain) UILabel            *statusShow;
@property(nonatomic,retain) UILabel            *priorityShow;
@property(nonatomic,assign) id <UIViewControllerDelegate> delegate;

- (void) updateStatus:(id) sender;
- (void) updatePriority:(id) sender;
- (void) updateText:(id) sender;
- (void)leanBack:(id) sender;

@end
