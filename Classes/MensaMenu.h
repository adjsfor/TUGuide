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
@property (nonatomic,assign) NSDate *date;
@property (nonatomic,assign) NSString *name;
@property (nonatomic,assign) NSString *content;

@end
