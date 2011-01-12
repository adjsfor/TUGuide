//
//  TodoCell.h
//  TUGuide
//
//  Created by Ivo Galic on 1/11/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface TodoCell : UITableViewCell {
	Todo        *todo;
    UILabel     *todoTextLabel;
    UILabel     *todoPriorityLabel;
    UIImageView *todoPriorityImageView;
}

@property (nonatomic, retain) UILabel     *todoTextLabel;
@property (nonatomic, retain) UILabel     *todoPriorityLabel;
@property (nonatomic, retain) UIImageView *todoPriorityImageView;

- (UIImage *)imageForPriority:(NSInteger)priority;

- (Todo *)todo;
- (void)setTodo:(Todo *)newTodo;

@end