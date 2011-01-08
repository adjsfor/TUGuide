//
//  Eatery.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Eatery : NSObject {
	int eateryId;
	NSString *eateryType;
}

@property (nonatomic) int eateryId;
@property (nonatomic,retain) NSString *eateryType;

-(id)init;
-(id)initWithArguments:(int)eateryId withEateryType:(NSString *)eateryType;
+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

@end
