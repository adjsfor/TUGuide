//
//  Eatery.m
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import "Eatery.h"


@implementation Eatery

@synthesize eateryId;
@synthesize eateryType;

-(id)initWithArguments:(int)eateryId2 withEateryType:(NSString *)eateryType2{
	
	if (self = [super init]) {
		self.eateryId = eateryId2;
		self.eateryType = eateryType2;
	}
	return self;
}

-(id)init{
	return [self initWithArguments:0 withEateryType:nil];
}

+ (id)customClassWithProperties:(NSDictionary *)properties {
	return [[[self alloc] initWithProperties:properties] autorelease];
}

- (id)initWithProperties:(NSDictionary *)properties {
	if (self = [self init]) {
		[self setValuesForKeysWithDictionary:properties];
	}
	return self;
}

-(void)dealloc{
	[eateryType release];
	[super dealloc];
}

@end
