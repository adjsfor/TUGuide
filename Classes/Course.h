//
//  Course.h
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 TuGuide. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Course : NSObject {
	int courseId;
	NSString *name;
	NSString *courseNumber;
}

@property (nonatomic) int courseId;
@property (nonatomic,assign) NSString *name;
@property (nonatomic,assign) NSString *courseNumber;

-(id)init;


@end
