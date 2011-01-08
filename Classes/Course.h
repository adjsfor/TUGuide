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
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *courseNumber;

-(id)init;
+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

@end
