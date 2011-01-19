//
//  Friend.h
//  TUGuide
//
//  Created by Jakub Kolesik on 27.11.10.
//  Copyright 2010 TU WIEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Friend : NSObject <MKAnnotation>{
	int beFriendId;
	int friendId;
	bool approved;
	NSString *screen_name;
	NSString *title;
	NSString *subtitle;
	NSNumber *coordinates_lat;
	NSNumber *coordinates_lon;
	NSString *last_login;
}

@property (nonatomic) int beFriendId;
@property (nonatomic) int  friendId;
@property (nonatomic) bool approved;
@property (nonatomic,retain) NSString *title;
@property (nonatomic,retain) NSString *subtitle;
@property (nonatomic,retain) NSNumber *coordinates_lat;
@property (nonatomic,retain) NSNumber *coordinates_lon;
@property (nonatomic,retain) NSString *screen_name;
@property (nonatomic,retain) NSString *last_login;

+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

@end
