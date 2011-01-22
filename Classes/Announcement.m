//
//  Announcement.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Announcement.h"


@implementation Announcement

@synthesize message;
@synthesize report;

@synthesize id;
@synthesize when_announced;
@synthesize lecture_id;
@synthesize user_id;
@synthesize uuid;


+ (id)customClassWithProperties:(NSDictionary *)properties {
	return [[[self alloc] initWithProperties:properties] autorelease];
}

- (id)initWithProperties:(NSDictionary *)properties {
	if (self = [self init]) {
		//[self setValuesForKeysWithDictionary:properties];
		self.message = [properties objectForKey:@"message"];
		self.report = [properties objectForKey:@"report"];
		self.id = (int)[properties objectForKey:@"id"];
		self.when_announced = [properties objectForKey:@"when_announced"];
		self.lecture_id = (int)[properties objectForKey:@"lecture_id"];
		self.user_id = (int)[properties objectForKey:@"user_id"];
		self.uuid = (int)[properties objectForKey:@"uuid"];
	}
	return self;
}

-(void)dealloc{
	[when_announced release];
	[message release];
	[report release];
	[super dealloc];
}

@end
