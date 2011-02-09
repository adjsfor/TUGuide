//
//  TodoCell.m
//  TUGuide
//
//  Created by Ivo Galic on 1/11/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import "TodoCell.h"

#define TODO_RED_COLOR		[UIColor colorWithRed:1.00f green:0.95f blue:0.96f alpha:5.2f]
#define TODO_YELLOW_COLOR	[UIColor colorWithRed:0.98f green:1.0f blue:0.90f alpha:5.2f]
#define TODO_GREEN_COLOR	[UIColor colorWithRed:0.91f green:1.0f blue:0.92f alpha:5.2f]

static UIImage *priority1Image = nil;
static UIImage *priority2Image = nil;
static UIImage *priority3Image = nil;

@interface TodoCell()
- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor selectedColor:
(UIColor *)selectedColor fontSize:(CGFloat)fontSize bold:(BOOL)bold;
@end

@implementation TodoCell

@synthesize todoTextLabel,todoPriorityLabel,todoPriorityImageView;

+ (void)initialize
{
    // The priority images are cached as part of the class, so they need to be
    // explicitly retained.

    priority1Image = [[UIImage imageNamed:@"done.png"] retain];
    priority2Image = [[UIImage imageNamed:@"incomplete.png"] retain];
	priority3Image = [[UIImage imageNamed:@"done.png"] retain];
	
}

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        UIView *myContentView = self.contentView;
        
		self.todoPriorityImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 25, 25)];
		self.todoPriorityImageView.image = priority1Image;
		[myContentView addSubview:self.todoPriorityImageView];
        [self.todoPriorityImageView release];
        
        self.todoTextLabel = [self newLabelWithPrimaryColor:[UIColor blackColor] 
											  selectedColor:[UIColor whiteColor] fontSize:17.0 bold:YES]; 
		self.todoTextLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]; 
		
		self.todoTextLabel.textAlignment = UITextAlignmentLeft; // default
		[myContentView addSubview:self.todoTextLabel];
		[self.todoTextLabel release];
		
        self.todoPriorityLabel = [self newLabelWithPrimaryColor:[UIColor blackColor] 
												  selectedColor:[UIColor whiteColor] fontSize:10.0 bold:YES];
		self.todoPriorityLabel.textAlignment = UITextAlignmentRight;
		[myContentView addSubview:self.todoPriorityLabel];
		[self.todoPriorityLabel release];
        
        // Position the todoPriorityImageView above all of the other views so
        // it's not obscured. It's a transparent image, so any views
        // that overlap it will still be visible.
        [myContentView bringSubviewToFront:self.todoPriorityImageView];
    }
    return self;
}

- (Todo *)todo
{
    return self.todo;
}

- (void)setTodo:(Todo *)newTodo
{
	
    todo = newTodo;
    
    self.todoTextLabel.text = newTodo.text;
    self.todoPriorityImageView.image = [self imageForComplete:newTodo.status];

	switch(newTodo.priority) {
		case 2:
			//self.todoPriorityLabel.text = @"Medium";
			self.backgroundColor = TODO_YELLOW_COLOR;
			//todoTextLabel.backgroundColor = TODO_YELLOW_COLOR;
			todoTextLabel.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]; 

			break;
		case 3:
			//self.todoPriorityLabel.text = @"Low";
			self.backgroundColor = TODO_GREEN_COLOR;
			todoTextLabel.backgroundColor = TODO_GREEN_COLOR;
			break;
		default:
			//self.todoPriorityLabel.text = @"High";
			self.backgroundColor = TODO_RED_COLOR;
			todoTextLabel.backgroundColor = TODO_RED_COLOR;
			break;
	}
	
    [self setNeedsDisplay];
}



- (void)layoutSubviews {
    
#define LEFT_COLUMN_OFFSET 5
#define LEFT_COLUMN_WIDTH 50
	
#define RIGHT_COLUMN_OFFSET 35
#define RIGHT_COLUMN_WIDTH 255
	
#define UPPER_ROW_TOP 4
    
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
	
    if (!self.editing) {
		
        CGFloat boundsX = contentRect.origin.x;
		CGRect frame;
        
        // Place the Text label.
		frame = CGRectMake(boundsX +RIGHT_COLUMN_OFFSET  , UPPER_ROW_TOP, RIGHT_COLUMN_WIDTH, 20);
		frame.origin.y = 15;
		self.todoTextLabel.frame = frame;
        
        // Place the priority image.
        UIImageView *imageView = self.todoPriorityImageView;
        frame = [imageView frame];
		frame.origin.x = boundsX + LEFT_COLUMN_OFFSET;
		frame.origin.y = 10;
 		imageView.frame = frame;
        
        // Place the priority label.
        CGSize prioritySize = [self.todoPriorityLabel.text sizeWithFont:self.todoPriorityLabel.font 
															   forWidth:RIGHT_COLUMN_WIDTH lineBreakMode:UILineBreakModeTailTruncation];
        CGFloat priorityX = frame.origin.x + imageView.frame.size.width + 8.0;
        frame = CGRectMake(priorityX, UPPER_ROW_TOP, prioritySize.width, prioritySize.height);
		frame.origin.y = 15;
        //self.todoPriorityLabel.frame = frame;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
	[super setSelected:selected animated:animated];
	
	UIColor *backgroundColor = nil;
	if (selected) {
	    backgroundColor = [UIColor clearColor];
	} else {
		backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
	}
    
	self.todoTextLabel.backgroundColor = backgroundColor;
	self.todoTextLabel.highlighted = selected;
	self.todoTextLabel.opaque = !selected;
	
	self.todoPriorityLabel.backgroundColor = backgroundColor;
	self.todoPriorityLabel.highlighted = selected;
	self.todoPriorityLabel.opaque = !selected;
}


- (UILabel *)newLabelWithPrimaryColor:(UIColor *)primaryColor 
						selectedColor:(UIColor *)selectedColor fontSize:(CGFloat)fontSize bold:(BOOL)bold
{
	
    UIFont *font;
    if (bold) {
        font = [UIFont boldSystemFontOfSize:fontSize];
    } else {
        font = [UIFont systemFontOfSize:fontSize];
    }
    
	UILabel *newLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	newLabel.backgroundColor = [UIColor whiteColor];
	newLabel.opaque = YES;
	newLabel.textColor = primaryColor;
	newLabel.highlightedTextColor = selectedColor;
	newLabel.font = font;
	
	return newLabel;
}

- (UIImage *)imageForComplete:(NSInteger)complete
{
	//XLog("===== %i",complete);
	if (complete == 0 ) {
		return priority2Image;
	}else {
		return priority1Image;
	}
	
	return nil;
}


- (void)dealloc {
	[super dealloc];
}


@end