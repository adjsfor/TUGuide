//
//  TodoDatabase.h
//  TUGuide
//
//  Created by Ivo Galic on 1/11/11.
//  Copyright 2011 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todo.h"
#import <sqlite3.h>


@interface TodoDatabase : NSObject {
	sqlite3 *database;
	NSMutableArray *todos;
}

@property (nonatomic, retain) NSMutableArray *todos;

// dao functions
- (void)removeTodo:(Todo *)todo;
- (Todo *)addTodo; 
- (void)createEditableCopyOfDatabaseIfNeeded;
- (void)initializeDatabase;


@end
