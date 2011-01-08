//
//  Friend.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Friend : NSObject {
	int beFriendId;
	int friendId;
	bool approved;
}

@property (nonatomic) int beFriendId;
@property (nonatomic) int  friendId;
@property (nonatomic) bool approved;

+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

@end
