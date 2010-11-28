//
//  Classroom.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Building.h"

@interface Classroom : NSObject {
	int classroomId;
	NSString *name;
	Building *building;
}

@property (nonatomic) int classroomId;
@property (nonatomic,assign) NSString *name;
@property (nonatomic,assign) Building *building;

-(id)init;
-(id)initWithArguments:(int)classroomId
			withName:(NSString *)name
		 withBuilding:(Building *)building;

@end
