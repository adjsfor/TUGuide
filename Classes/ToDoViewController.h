//
//  ToDoViewController.h
//  TUGuide
//
//  Created by Ivo Galic on 15.12.10.
//  Copyright 2010 7359. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewControllerDelegate.h"
#import "TodoDetailViewController.h"
#import "TodoDatabase.h"
#import "TodoCell.h"

@interface ToDoViewController : UITableViewController <UIViewControllerDelegate> {
	id <UIViewControllerDelegate>  delegate;
	TodoDatabase *db;
	TodoDetailViewController *todoView;
	Todo *todoTempDatabase;
}

@property (assign) id <UIViewControllerDelegate> delegate;
//@property (nonatomic, retain) NSMutableArray *todos;
@property (nonatomic, retain) TodoDatabase *db;
@property (nonatomic, retain) TodoDetailViewController *todoView;
@property (nonatomic, retain) Todo *todoTempDatabase;

- (void) passTo:(UIViewController *)requestor command:(NSString *)cmd message:(NSString *)msg;

@end
