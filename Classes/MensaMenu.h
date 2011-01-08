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
	int mesnaMenuId;
	int mensaId;
	NSDate *date;
	NSString *name;
	NSString *content;

}


@property (nonatomic) int mesnaMenuId;
@property (nonatomic) int mensaId;
@property (nonatomic,retain) NSDate *date;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *content;

+ (id)customClassWithProperties:(NSDictionary *)properties;
- (id)initWithProperties:(NSDictionary *)properties;

@end
