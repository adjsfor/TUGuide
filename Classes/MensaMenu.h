//
//  MensaMenu.h
//  TUGuide
//
//  Created by Ivo Galic on 11/27/10.
//  Copyright 2010 Galic Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MensaMenu : NSObject {
	@private
	int id;
	int mensa_id;
	NSDate *date;
	NSString *name;
	NSString *content;
	NSString *created;
	NSString *updated;

}


@property (nonatomic) int mensa_id;
@property (nonatomic) int id;
@property (nonatomic,retain) NSDate *date;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *content;
@property (nonatomic,retain) NSString *created;
@property (nonatomic,retain) NSString *updated;

+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

@end
