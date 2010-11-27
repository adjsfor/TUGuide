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

@property (nonatomic,assign) int eateryId;
@property (nonatomic,assign) NSString *eateryType;

-(id)init;
-(id)initWithArguments:(int)eateryId withEateryType:(NSString *)eateryType;

@end
